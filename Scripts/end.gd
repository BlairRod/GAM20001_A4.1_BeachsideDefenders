extends Control

@onready var bg_animation : AnimationPlayer = $AnimationPlayer
@onready var win_bg : TextureRect = $WinBackground
@onready var loss_bg : TextureRect = $LoseBackground
@onready var balls : Node2D = $Balls
@onready var heads : Node2D = $Heads
@onready var score_button : RigidBody2D = $ScoreButton
@onready var loss_label : Label = $LossLabel
@onready var loss_label_collision : CollisionPolygon2D = $StaticCollisionObjects/YouLoseCollision
@onready var wiped_label_collision : CollisionPolygon2D = $StaticCollisionObjects/Wiped_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(!GlobalSingleton.GameWon):
		#win_bg.hide()
		win_bg.queue_free()
		loss_bg.show()
		#balls.hide()
		balls.queue_free()
		heads.show()
		#score_button.hide()
		score_button.queue_free()
		loss_label.show()
		bg_animation.play("loss_bg")
	else:
		win_bg.show()
		#loss_bg.hide()
		loss_bg.queue_free()
		balls.show()
		#heads.hide()
		heads.queue_free()
		score_button.show()
		loss_label.queue_free()
		loss_label_collision.queue_free()
		wiped_label_collision.queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_score_pressed() -> void:
	print("SCORE")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	SceneSwitcher.switch_scene("res://Scenes/main_menu.tscn")
