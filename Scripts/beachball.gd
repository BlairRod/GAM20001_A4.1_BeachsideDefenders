extends RigidBody2D

var first_touch
var release
var can_shoot : bool = false
var first_touch_set : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	if(mouse_pos.x <= position.x + 16 and mouse_pos.x >= position.x - 16 and mouse_pos.y <= position.y + 16 and mouse_pos.y >= position.y - 16):
		can_shoot = true
	else:
		can_shoot = false
	if can_shoot:
		if(Input.is_action_just_pressed("Click")):
			first_touch = get_global_mouse_position()
			first_touch_set = true
	if first_touch_set:
		if(Input.is_action_just_released("Click")):
			release = get_global_mouse_position()
			var dir = -(release - first_touch).normalized()
			linear_velocity = dir * delta * 30000
			first_touch_set = false
