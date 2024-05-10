extends CharacterBody2D

var speed = 200
var padding = 20

func _physics_process(_delta):
	var direction = Input.get_axis("left","right")
	velocity = direction * speed * transform.x
	move_and_slide()
	
	# Keep player on the screen
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0 + padding, viewRect.size.x - padding)
	#global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
