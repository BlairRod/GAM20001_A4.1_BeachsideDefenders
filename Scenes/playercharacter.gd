extends CharacterBody2D

var speed = 100
#var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerMovement()

func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	velocity = velocity.normalized() * speed
	
	#lobal_position = global_position.clamp(Vector2(0,0), screen_size)
	
	move_and_slide()
