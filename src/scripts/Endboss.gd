extends KinematicBody2D

var move_speed = 10
var hits = 50
var shootingcount = rand_range(10, 70)
var test = rand_range(0,50)
var points = 40

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	shootingcount +=delta
	if global_position.y >= 0:
		shoot()	
	
func kill():
	hits -= 1
	if hits == 0:
		Global.add_Score(points)
		Global.hudScore.set_text(str(Global.score))
		get_tree().reload_current_scene()

func shoot():
	if shootingcount >= 30:
		var bullet = preload("res://AstroApe/src/tscn/AlienBullet.tscn")
		var firedbullet1 = bullet.instance()
		var firedbullet3 = bullet.instance()
		var firedbullet5 = bullet.instance()
		firedbullet1.position = Vector2(position.x,position.y)
		firedbullet3.position = Vector2(position.x+70,position.y)
		firedbullet5.position = Vector2(position.x-70,position.y)
		get_parent().call_deferred("add_child", firedbullet1)
		get_parent().call_deferred("add_child", firedbullet3)
		get_parent().call_deferred("add_child", firedbullet5)
		
		shootingcount = rand_range(20, 70)
