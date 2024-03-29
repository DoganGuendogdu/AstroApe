extends KinematicBody2D

var move_speed = 10
var hits = 2
var shootingcount = rand_range(10, 70)
var points = 10


func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	#print(position.y)
	shootingcount +=delta
	if global_position.y >= 0:
		shoot()
	if global_position.y >= 245.46: #215.46
		get_tree().reload_current_scene()
	
func kill():
	hits -= 1
	if hits == 0:
		Global.add_Score(points)
		Global.hudScore.set_text(str(Global.score))
		queue_free()
		


func shoot():
	if shootingcount >= 40:
		var bullet = preload("res://AstroApe/src/tscn/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x,position.y)
		get_parent().call_deferred("add_child", firedbullet)
		
		shootingcount = rand_range(20, 70)
