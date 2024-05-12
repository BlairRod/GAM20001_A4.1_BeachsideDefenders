extends CharacterBody2D

@export var bullet: PackedScene
@onready var spawn_point: Marker2D = $Muzzle
@onready var cooldown := $Cooldown

var speed = 200

func _physics_process(delta):
	var direction = Input.get_axis("left","right")
	velocity = direction * speed * transform.x
	move_and_slide()
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	if Input.is_action_just_pressed("shoot") and cooldown.is_stopped():
		var inst: Bullet = bullet.instantiate()
		get_parent().add_child(inst)
		inst.transform = spawn_point.global_transform
		cooldown.start()
