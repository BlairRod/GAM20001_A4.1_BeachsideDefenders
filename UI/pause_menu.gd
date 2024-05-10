extends Control

@export var main_game : MainGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	main_game.connect("toggle_game_paused", _on_main_game_toggle_game_paused)

func _on_main_game_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()

# Key input ebent handling
func _input(event : InputEvent):
	# Esc key pauses game
	if event.is_action_pressed("ui_cancel"):
		main_game.game_paused = false

func _on_resume_button_pressed() -> void:
	main_game.game_paused = false


func _on_main_button_pressed() -> void:
	main_game.game_paused = false
	SceneSwitcher.switch_scene("res://Scenes/game_manager.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
