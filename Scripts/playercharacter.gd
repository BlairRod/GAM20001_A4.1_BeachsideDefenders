extends CharacterBody2D

class_name Player

@export var main_game : MainGame
@export var bullet: PackedScene
@export var playerLives = 3
@onready var spawn_point: Marker2D = $Muzzle
@onready var cooldown := $Cooldown
@onready var player_animation : AnimationPlayer = $PlayerAnimations
@onready var player_sprite : Sprite2D = $Sprite2D
@onready var respawn_timer := $Respawn
@onready var lifeLabel = $"../CanvasLayer/UserInterface/LifeLabel"

var speed = 200
var initial_speed = 200
var padding = 20
var is_shooting : bool = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if(velocity.x > 0):
		player_animation.play("move_right")
	elif(velocity.x < 0):
		player_animation.play("move_left")
	elif(is_shooting == false):
		player_animation.play("idle")

func _physics_process(_delta):
	var direction = Input.get_axis("left","right")
	velocity = direction * speed * transform.x
	move_and_slide()
	
	# Keep player on the screen
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0 + padding, viewRect.size.x - padding)
	#global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	if Input.is_action_just_pressed("shoot") and cooldown.is_stopped():
		is_shooting = true
		player_animation.play("fire")
		var inst: Bullet = bullet.instantiate()
		get_parent().add_child(inst)
		inst.transform = spawn_point.global_transform
		cooldown.start()
		$FireSFX.play() 

func _on_player_animations_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "fire"):
		is_shooting = false

func respawn() -> void:
	if(playerLives <= 0):
		OutOfLives()
	visible = false
	speed = 0
	playerLives -= 1
	lifeLabel.text = "Lives: %d" % playerLives
	position = Vector2(576, 524)
	respawn_timer.start()

func OutOfLives():
	#print("No Lives Left")
	GlobalSingleton.GameWon = false
	main_game.EndGame()

func _on_respawn_timeout():
	visible = true
	speed = initial_speed
