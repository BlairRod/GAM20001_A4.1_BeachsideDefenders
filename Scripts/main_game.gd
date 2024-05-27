extends Node2D

class_name MainGame

@export var enemy_scene = preload("res://Scenes/enemy.tscn")

const ROWS = 3
const COLUMNS = 10
const HORIZONTAL_SPACING = 40
const VERTICAL_SPACING = 32
const START_Y_POSITION = 50
const START_X_POSITION = 195

var enemies_array = [Enemy]

var enemies : int:
	get:
		return enemies_array.size()
	set(value):
		enemies = value

# Called when the node enters the scene tree for the first time.
func _ready():
	set_enemy_spawn_positions()

func _process(_delta: float) -> void:
	#print(GlobalSingleton.EnemiesLeft)
	if(GlobalSingleton.EnemiesLeft == 0):
		GlobalSingleton.GameWon = true
		EndGame()

func set_enemy_spawn_positions():
	#var enemy_1_res = preload("res://Resources/enemy_3.tres")
	#var enemy_2_res = preload("res://Resources/enemy_2.tres")
	#var enemy_3_res = preload("res://Resources/enemy_1.tres")
	var enemy_config
	
	for row in ROWS:
		if row == 0:
			enemy_config = preload("res://Resources/enemy_3.tres")
		elif row == 1 or row == 3:
			enemy_config = preload("res://Resources/enemy_2.tres")
		elif row == 2 or row == 4:
			enemy_config = preload("res://Resources/enemy_1.tres")
		
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
	enemies_array.append(enemy)
	GlobalSingleton.EnemiesLeft += 1

func EndGame():
		SceneSwitcher.switch_scene("res://Scenes/end.tscn")

# Key input event handling
func _input(event : InputEvent):
	# Esc key pauses game
	if event.is_action_pressed("end_game_win"):
		GlobalSingleton.GameWon = true
		EndGame()
	elif event.is_action_pressed("end_game_loss"):
		GlobalSingleton.GameWon = false
		EndGame()
		


func _on_beach_ambience_finished() -> void:
	$BeachAmbience.play()
