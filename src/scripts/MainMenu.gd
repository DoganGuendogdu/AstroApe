extends Control


func _ready():
	$CenterContainer/VBoxContainer/AnimationPlayer.play("Start")

func _on_Start_game_pressed():
	get_tree().change_scene("res://AstroApe/src/tscn/Level1.tscn")


func _on_Quit_game_pressed():
	get_tree().quit()
