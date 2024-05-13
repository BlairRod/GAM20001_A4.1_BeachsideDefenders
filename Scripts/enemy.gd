extends Area2D

class_name  Enemy

@export var xspeed = 1000
@export var yspeed = 3000
@onready var xtimer = $XTimer

var health: float = 100.0
var rightcounter: int = 0
var leftcounter: int = 0
var downcounter: int = 0
var leftRightMaxTicks: int = 45 #if you change the speed then you must change this value until the enemy reaches the edge of the screen

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


func apply_damage(damage: float) -> void:
	health = clamp(health - damage, 0.0, 100.0)
	if health == 0.0:
		queue_free()
