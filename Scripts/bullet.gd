extends Area2D

class_name Bullet

var speed: float = 5.0
var damage: float = 100.0
var time_to_live: float =  1.75

# Called when the node enters the scene tree for the first time.
func _ready():
	handle_time_to_live()

func handle_time_to_live() -> void:
	var ttl_timer: Timer = Timer.new()
	add_child(ttl_timer)
	ttl_timer.wait_time = time_to_live
	ttl_timer.one_shot = true
	ttl_timer.timeout.connect(func(): queue_free())
	ttl_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position -= transform.y * speed

func _on_area_entered(area):
	if area is Enemy:
		var enemy: Enemy = area as Enemy
		enemy.apply_damage(damage)
	queue_free()
