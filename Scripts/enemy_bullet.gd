extends Area2D

class_name EnemyBullet

var speed: float = 5.0
var damage: float = 100.0
var time_to_live: float =  2

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
	position += transform.y * speed

func _on_body_entered(body):
	if body is Player:
		var player: Player = body as Player
		player.respawn()
		print('You have been shot')
	queue_free()
