extends Control

@onready var bg_animation : AnimationPlayer = $AnimationPlayer
@onready var win_bg : TextureRect = $WinBackground
@onready var loss_bg : TextureRect = $LoseBackground
@onready var balls : Node2D = $Balls
@onready var heads : Node2D = $Heads
@onready var score_button : RigidBody2D = $ScoreButton
@onready var win_label1: Label = $WinLabel1
@onready var win_label2: Label = $WinLabel2
@onready var win_label3: Label = $WinLabel3
@onready var loss_label : Label = $LossLabel
@onready var loss_label_collision : CollisionPolygon2D = $StaticCollisionObjects/YouLoseCollision
@onready var wiped_label_collision : CollisionPolygon2D = $StaticCollisionObjects/Wiped_label
@onready var you_win_collision: CollisionPolygon2D = $StaticCollisionObjects/YouWinCollision
@onready var you_score_collision: CollisionPolygon2D = $StaticCollisionObjects/YouScoreCollision
@onready var saved_collision: CollisionPolygon2D = $StaticCollisionObjects/SavedCollision
@onready var for_now_collision: CollisionPolygon2D = $StaticCollisionObjects/ForNowCollision
@onready var score_collision: CollisionPolygon2D = $StaticCollisionObjects/ScoreCollision


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
		you_win_collision.queue_free()
		you_score_collision.queue_free()
		score_collision.queue_free()
		saved_collision.queue_free()
		for_now_collision.queue_free()
		win_label1.hide()
		win_label2.hide()
		win_label3.hide()
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
		wiped_label_collision.show()
		you_win_collision.show()
		you_score_collision.show()
		saved_collision.show()
		for_now_collision.show()
		win_label1.show()
		win_label2.show()
		win_label3.show()
		loss_label.hide()
		loss_label_collision.queue_free()
		wiped_label_collision.queue_free()
		win_label1.text = "YOU WIN!\nYOUR FINAL SCORE WAS:"
		win_label2.text = str(GlobalSingleton.Score)
		win_label3.text = "HUMANITY WAS SAVED FROM THE OCEAN INVADERS.\nFOR NOW!!"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_score_pressed() -> void:
	print("SCORE")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	SceneSwitcher.switch_scene("res://Scenes/main_menu.tscn")
