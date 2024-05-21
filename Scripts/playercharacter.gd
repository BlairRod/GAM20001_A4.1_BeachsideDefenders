extends CharacterBody2D

class_name Player

@export var bullet: PackedScene
@export var playerLives = 3
@onready var spawn_point: Marker2D = $Muzzle
@onready var cooldown := $Cooldown
@onready var respawn_timer := $Respawn
@onready var lifeLabel = $"../CanvasLayer/UserInterface/LifeLabel"

var speed = 200
var initial_speed = 200

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

func respawn() -> void:
	visible = false
	speed = 0
	playerLives -= 1
	lifeLabel.text = "Lives: %d" % playerLives
	position = Vector2(576, 524)
	respawn_timer.start()

func _on_respawn_timeout():
	visible = true
	speed = initial_speed
