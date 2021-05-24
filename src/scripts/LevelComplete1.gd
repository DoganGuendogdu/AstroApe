extends Area2D

export (String,FILE, "*.tscn") var world_scene

func _physics_process(delta: float) -> void:
	
	# Array von Formen, die sich mit der Area2D ueberschneiden
	var bodies = get_overlapping_bodies()
	
	# Wenn der Player mit der Area2d in Beruehrung kommt
	for body in bodies:
		if body.name == "Player":
			
			# Wechsel zur Welt2
			get_tree().change_scene(world_scene)
