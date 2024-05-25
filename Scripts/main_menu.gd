extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var exit_button_control : Control = $ExitButton

var exit_rotation = 0.002
var exit_speed = 0.2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("background")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var viewRect := get_viewport_rect()
	exit_button_control.rotation += exit_rotation
	exit_button_control.position.x += exit_speed
	if(exit_button_control.position.x >= viewRect.size.x - 50):
		reverse_exit_button()
	elif(exit_button_control.position.x <= 0 + 50):
		reverse_exit_button()

func reverse_exit_button():
	exit_rotation = -exit_rotation
	exit_speed = -exit_speed


func _on_start_pressed() -> void:
	SceneSwitcher.switch_scene("res://Scenes/main_game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
