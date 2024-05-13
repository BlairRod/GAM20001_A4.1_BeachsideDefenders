extends Node2D

<<<<<<< HEAD
class_name MainGame

# Signal for sending game pause status
signal toggle_game_paused(is_paused : bool)

# Getter and setter for pausing
var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)
=======
class_name main_game

@export var enemy_scene = preload("res://Scenes/enemy.tscn")

var enemy1: bool = false
var enemy2: bool = false
var enemy3: bool = false
var enemy4: bool = false
var enemy5: bool = false
var enemy6: bool = false
var enemy7: bool = false
var enemy8: bool = false
var enemy9: bool = false
var enemy10: bool = false
var enemy11: bool = false
var enemy12: bool = false
var enemy13: bool = false
var enemy14: bool = false
var enemy15: bool = false
var enemy16: bool = false
var enemy17: bool = false
var enemy18: bool = false
var enemy19: bool = false
var enemy20: bool = false
var enemy21: bool = false
var enemy22: bool = false
var enemy23: bool = false
var enemy24: bool = false
var enemy25: bool = false
var enemy26: bool = false
var enemy27: bool = false
var enemy28: bool = false
var enemy29: bool = false
var enemy30: bool = false

>>>>>>> anthony's-work

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
<<<<<<< HEAD

# Key input ebent handling
func _input(event : InputEvent):
	# Esc key pauses game
	if event.is_action_pressed("ui_cancel"):
		game_paused = !game_paused
=======
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	if enemy1 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(20, 20)
		add_child(enemy)
		enemy1 = true
	if enemy2 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(60, 20)
		add_child(enemy)
		enemy2 = true
	if enemy3 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(100, 20)
		add_child(enemy)
		enemy3 = true
	if enemy4 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(140, 20)
		add_child(enemy)
		enemy4 = true
	if enemy5 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(180, 20)
		add_child(enemy)
		enemy5 = true
	if enemy6 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(220, 20)
		add_child(enemy)
		enemy6 = true
	if enemy7 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(260, 20)
		add_child(enemy)
		enemy7 = true
	if enemy8 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(300, 20)
		add_child(enemy)
		enemy8 = true
	if enemy9 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(340, 20)
		add_child(enemy)
		enemy9 = true
	if enemy10 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(380, 20)
		add_child(enemy)
		enemy10 = true
	if enemy11 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(20, 60)
		add_child(enemy)
		enemy11 = true
	if enemy12 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(60, 60)
		add_child(enemy)
		enemy12 = true
	if enemy13 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(100, 60)
		add_child(enemy)
		enemy13 = true
	if enemy14 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(140, 60)
		add_child(enemy)
		enemy14 = true
	if enemy15 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(180, 60)
		add_child(enemy)
		enemy15 = true
	if enemy16 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(220, 60)
		add_child(enemy)
		enemy16 = true
	if enemy17 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(260, 60)
		add_child(enemy)
		enemy17 = true
	if enemy18 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(300, 60)
		add_child(enemy)
		enemy18 = true
	if enemy19 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(340, 60)
		add_child(enemy)
		enemy19 = true
	if enemy20 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(380, 60)
		add_child(enemy)
		enemy20 = true
	if enemy21 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(20, 100)
		add_child(enemy)
		enemy21 = true
	if enemy22 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(60, 100)
		add_child(enemy)
		enemy22 = true
	if enemy23 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(100, 100)
		add_child(enemy)
		enemy23 = true
	if enemy24 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(140, 100)
		add_child(enemy)
		enemy24 = true
	if enemy25 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(180, 100)
		add_child(enemy)
		enemy25 = true
	if enemy26 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(220, 100)
		add_child(enemy)
		enemy26 = true
	if enemy27 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(260, 100)
		add_child(enemy)
		enemy27 = true
	if enemy28 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(300, 100)
		add_child(enemy)
		enemy28 = true
	if enemy29 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(340, 100)
		add_child(enemy)
		enemy29 = true
	if enemy30 == false:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = Vector2(380, 100)
		add_child(enemy)
		enemy30 = true
>>>>>>> anthony's-work
