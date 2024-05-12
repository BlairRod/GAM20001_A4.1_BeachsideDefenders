extends Area2D

class_name  Enemy

@export var speed = 150

var health: float = 100.0

func _physics_process(delta):
	global_position.y += speed * delta

func apply_damage(damage: float) -> void:
	health = clamp(health - damage, 0.0, 100.0)
	if health == 0.0:
		queue_free()
