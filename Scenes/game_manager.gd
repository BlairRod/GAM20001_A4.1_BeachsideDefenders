extends Node

@onready var opening_timer : Timer = $OpeningTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Delay timer on opening the game and displaying logo
	opening_timer.wait_time = 2
	opening_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when the opening_timer countdown completes
func _on_opening_timer_timeout() -> void:
	pass # Replace with function body.
