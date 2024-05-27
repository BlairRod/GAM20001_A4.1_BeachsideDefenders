extends Area2D

class_name Bullet


@onready var bullet_animation : AnimationPlayer = $AnimationPlayer

@export var killCount = 0
var speed: float = 5.0
var killed_enemies: int = 1
var time_to_live: float =  1.75

# Called when the node enters the scene tree for the first time.
func _ready():
	handle_time_to_live()
	bullet_animation.play("move")

func handle_time_to_live() -> void:
	var ttl_timer: Timer = Timer.new()
	add_child(ttl_timer)
	ttl_timer.wait_time = time_to_live
	ttl_timer.one_shot = true
	ttl_timer.timeout.connect(func(): queue_free())
	ttl_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	position -= transform.y * speed

func on_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.

func _on_area_entered(area):
	if area is Enemy:
		var enemy: Enemy = area as Enemy
		enemy.apply_damage()
		
	queue_free()
	killCount += 1
