extends Node2D

@export var enemy_scene = preload("res://Scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.global_position = Vector2(100, 10)
	add_child(enemy)
