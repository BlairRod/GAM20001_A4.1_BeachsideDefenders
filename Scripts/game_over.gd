extends Node2D


var win = false
var score = 0


func _ready():

    var label = $Label
    if win:
        label.text = "You Win! Score: " + str(score)
    else:
        label.text = "Game Over! Your land was invaded."
    
   
    $ReplayButton.connect("pressed", self, "_on_replay_button_pressed")
    $MainMenuButton.connect("pressed", self, "_on_main_menu_button_pressed")
    $ExitButton.connect("pressed", self, "_on_exit_button_pressed")


func _on_replay_button_pressed():
    get_tree().change_scene("res://MainGame.tscn")


func _on_main_menu_button_pressed():
    get_tree().change_scene("res://MainMenu.tscn")


func _on_exit_button_pressed():
    get_tree().quit()
