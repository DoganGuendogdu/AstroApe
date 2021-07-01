extends KinematicBody2D

var Move_Speed = 200
var Life_time = 55
var Life_spawn  = 0

func _physics_process(delta):
	var colision = move_and_collide(Vector2.UP * delta * Move_Speed)
	if colision and colision.collider.has_method("kill"):
		colision.collider.kill()
		queue_free()
	Life_spawn += 1
	if Life_spawn > Life_time:
		queue_free()
		
