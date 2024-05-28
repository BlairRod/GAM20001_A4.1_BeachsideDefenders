extends Node2D


var player_lives = 3
var score = 0
onready var enemies = $EnemiesArray

func _process(delta):
  
    if player_lives < 0:
        _game_over(false)

    elif enemies.get_child_count() <= 0:
        score += 100 * player_lives
        _game_over(true)

func _game_over(win):

    var game_over_scene = load("res://GameOver.tscn").instance()
    game_over_scene.set("win", win)
    game_over_scene.set("score", score)
    get_tree().change_scene_to(game_over_scene)
