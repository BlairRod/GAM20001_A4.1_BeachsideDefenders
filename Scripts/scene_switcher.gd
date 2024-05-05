extends Node

# Helper for switching scenes
# SceneSwitcher.switch_scene(secene_path)

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)


# Function called to switch scenes
func switch_scene(res_path) -> void:
	# calls this method during idle time, after current game loop finishes
	call_deferred("_deffered_switch_scene", res_path)

func _deffered_switch_scene(res_path) -> void:
	current_scene.free()
	var scene = load(res_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
