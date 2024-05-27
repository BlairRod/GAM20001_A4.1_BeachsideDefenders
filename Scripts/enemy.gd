extends Area2D

class_name  Enemy

@export var xspeed = 1000
@export var yspeed = 3000
@export var bullet: PackedScene
@export var points = 10
@onready var spawn_point: Marker2D = $Marker2D
@onready var xtimer = $XTimer
@onready var sprite_2d = $Sprite2D
@onready var score_label = $"../CanvasLayer/UserInterface/ScoreLabel"

var config: Resource

var score : int = 0
var shoot_chance
@export var killed_enemies: int = 0
var health: float = 100.0
var rightcounter: int = 0
var leftcounter: int = 0
var downcounter: int = 0
var leftRightMaxTicks: int = 45 #if you change the speed then you must change this value until the enemy reaches the edge of the screen

func _ready():
	sprite_2d.texture = config.sprite

func _process(_delta):
	enemy_shoots()

func _physics_process(delta):
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
	queue_free()
	score += 10
	killed_enemies += 1
	print(killed_enemies)
	score_label.text = "Score: %s" % str(score * killed_enemies)

func enemy_shoots() -> void:
	
	if xtimer.is_stopped():
		shoot_chance = randi_range(0,100)
		if killed_enemies < 10:
			if shoot_chance <= killed_enemies:
				var inst: EnemyBullet = bullet.instantiate()
				get_parent().add_child(inst)
				inst.transform = spawn_point.global_transform
		else:
			if shoot_chance <= 10:
				var inst: EnemyBullet = bullet.instantiate()
				get_parent().add_child(inst)
				inst.transform = spawn_point.global_transform
