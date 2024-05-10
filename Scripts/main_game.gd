extends Node2D

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Key input ebent handling
func _input(event : InputEvent):
	# Esc key pauses game
	if event.is_action_pressed("ui_cancel"):
		game_paused = !game_paused
