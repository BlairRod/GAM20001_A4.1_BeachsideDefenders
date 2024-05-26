extends Control

@export var game_manager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)
	
	# Key input event handling
func _input(event : InputEvent):
	# Esc key pauses game
	if event.is_action_pressed("ui_cancel"):
		game_manager.game_paused = false

func _on_game_manager_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()

func _on_resume_pressed() -> void:
	game_manager.game_paused = false


func _on_main_menu_pressed() -> void:
	game_manager.game_paused = false
	SceneSwitcher.switch_scene("res://Scenes/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
