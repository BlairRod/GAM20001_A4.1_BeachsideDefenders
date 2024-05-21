extends Node

class_name PointsCounter

signal on_points_increased(points: int)

var points = 0

@onready var main_game = $"../main_game" as MainGame

func _ready():
	#main_game.enemy_destroyed.connect(increase_points)
	pass

func increase_points(points_to_add: int):
	points += points_to_add
	on_points_increased.emit(points)
