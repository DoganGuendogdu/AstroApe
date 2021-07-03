extends Area2D


func _physics_process(delta):
	position.y -=2

func _on_Area2D_body_entered(body):
	if body.name =="Ship":
		Global.reset_Score()
		get_tree().reload_current_scene()
	#if body.name == "Schuss":
	#	queue_free()
