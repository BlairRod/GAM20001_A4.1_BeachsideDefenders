extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("background")

func _on_start_pressed() -> void:
	SceneSwitcher.switch_scene("res://Scenes/game_manager.tscn")

func _on_texture_button_pressed() -> void:
	get_tree().quit()
