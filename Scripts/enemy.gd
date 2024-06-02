extends Area2D

class_name Enemy

@export var xspeed = 1000
@export var yspeed = 3000
@export var bullet: PackedScene
@onready var points
@onready var spawn_point: Marker2D = $Marker2D
@onready var xtimer = $XTimer
@onready var sprite_2d = $Sprite2D
@onready var score_label = $"../CanvasLayer/UserInterface/ScoreLabel"
@onready var enemy_animations: AnimationPlayer = $EnemyAnimations

var config: Resource

var score : int = 0
var shoot_chance
@export var killed_enemies: int = 0
var health: float = 100.0
var rightcounter: int = 0
var leftcounter: int = 0
var downcounter: int = 0
var leftRightMaxTicks: int = 45 #if you change the speed then you must change this value until the enemy reaches the edge of the screen
var can_move : bool = true

func _ready():
	#sprite_2d.texture = config.sprite
	points = config.points
	enemy_animations.play(config.enemy_move_animation)

func _process(_delta):
	if can_move:
		enemy_shoots()

func _physics_process(delta):
	if can_move:
		if xtimer.is_stopped() and rightcounter < leftRightMaxTicks:
			global_position.x += xspeed * delta
			rightcounter = rightcounter + 1
			xtimer.start()
		elif xtimer.is_stopped() and rightcounter == leftRightMaxTicks and downcounter == 0:
			global_position.y += yspeed * delta
			downcounter = downcounter + 1
			xtimer.start()
		elif xtimer.is_stopped() and leftcounter < leftRightMaxTicks:
			global_position.x -= xspeed * delta
			leftcounter = leftcounter + 1
			xtimer.start()
		elif xtimer.is_stopped() and leftcounter == leftRightMaxTicks and downcounter == 1:
			global_position.y += yspeed * delta
			downcounter = downcounter + 1
			xtimer.start()
		elif downcounter == 2:
			rightcounter = 0
			leftcounter = 0
			downcounter = 0

func apply_damage() ->void:
	can_move = false
	enemy_animations.play(config.enemy_death_animation)
	score += 10
	GlobalSingleton.Score += points
	GlobalSingleton.KilledEnemies += 1
	print(GlobalSingleton.KilledEnemies)
	score_label.text = "Score: %s" % str(GlobalSingleton.Score)
	GlobalSingleton.EnemiesLeft -= 1
	$AudioStreamPlayer2D2.play()

func enemy_shoots() -> void:
	if xtimer.is_stopped():
		shoot_chance = randi_range(0,1000)
		if GlobalSingleton.KilledEnemies < 10:
			if shoot_chance <= GlobalSingleton.KilledEnemies:
				shoot()
		else:
			if shoot_chance <= 10:
				shoot()

func shoot():
	var inst: EnemyBullet = bullet.instantiate()
	get_parent().add_child(inst)
	inst.transform = spawn_point.global_transform
	enemy_animations.play(config.enemy_shoot_animation)
	$AudioStreamPlayer2D.play()

func _on_enemy_animations_animation_finished(anim_name: StringName) -> void:
	if(anim_name == config.enemy_death_animation):
		queue_free()
	if((anim_name == config.enemy_shoot_animation)):
		enemy_animations.play(config.enemy_move_animation)
