extends Node2D

class_name MainGame

@export var enemy_scene = preload("res://Scenes/enemy.tscn")

const ROWS = 3
const COLUMNS = 10
const HORIZONTAL_SPACING = 40
const VERTICAL_SPACING = 32
const START_Y_POSITION = 20
const START_X_POSITION = 195

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_1_res = preload("res://Resources/enemy_1.tres")
	
	var enemy_config
	for row in ROWS:
		if row == 0 || row == 1 || row == 2:
			enemy_config = enemy_1_res
		
		var row_width = (COLUMNS * enemy_config.width * 3) + ((COLUMNS -1) * HORIZONTAL_SPACING)
		var start_x = ((position.x - row_width) / 2) + START_X_POSITION
		
		for col in COLUMNS:
			var x = start_x + (col * enemy_config.width * 3) + (col * HORIZONTAL_SPACING)
			var y = START_Y_POSITION + (row * 1) + (row * VERTICAL_SPACING)
			var spawn_position = Vector2(x, y)
			
			spawn_enemy(enemy_config, spawn_position)

func spawn_enemy(enemy_config, spawn_position: Vector2):
	var enemy = enemy_scene.instantiate() as Enemy
	enemy.config = enemy_config
	enemy.global_position = spawn_position
	add_child(enemy)
