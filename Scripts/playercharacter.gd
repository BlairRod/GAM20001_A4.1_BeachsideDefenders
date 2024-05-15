extends CharacterBody2D

class_name Player

@export var bullet: PackedScene
@onready var spawn_point: Marker2D = $Muzzle
@onready var cooldown := $Cooldown

var speed = 200
var padding = 20

func _physics_process(_delta):
	var direction = Input.get_axis("left","right")
	velocity = direction * speed * transform.x
	move_and_slide()
	
	# Keep player on the screen
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0 + padding, viewRect.size.x - padding)
	#global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	if Input.is_action_just_pressed("shoot") and cooldown.is_stopped():
		var inst: Bullet = bullet.instantiate()
		get_parent().add_child(inst)
		inst.transform = spawn_point.global_transform
		cooldown.start()
