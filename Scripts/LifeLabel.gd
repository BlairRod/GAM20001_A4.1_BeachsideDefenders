extends Label

class_name LifeCounter

var lives = 3

func life_lost():
	lives -= 1
	text = "Lives: %s" % lives
