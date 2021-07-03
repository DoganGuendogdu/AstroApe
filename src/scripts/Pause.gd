extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_btn_Quit_pressed():
	get_tree().quit()


func _on_btn_resume_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_btn_Menu_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().change_scene("res://AstroApe/src/tscn/MainMenu.tscn")
	get_tree().paused = new_pause_state
