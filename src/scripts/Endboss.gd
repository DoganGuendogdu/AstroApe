extends KinematicBody2D

var move_speed = 5
var hits = 50
var shootingcount = rand_range(10, 70)
var test = rand_range(0,50)

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	"""if test <= 25:
		var collision2 = move_and_collide(Vector2.LEFT * delta * move_speed)
		var test = rand_range(0,50)
	elif test > 25:
		var collision3 = move_and_collide(Vector2.RIGHT * delta * move_speed)
		var test = rand_range(0,50)"""
	shootingcount +=delta
	if global_position.y >= 0:
		shoot()	
	
func kill():
	hits -= 1
	if hits == 0:
		get_tree().reload_current_scene()

func shoot():
	if shootingcount >= 40:
		var bullet = preload("res://AstroApe/src/tscn/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x,position.y)
		get_parent().call_deferred("add_child", firedbullet)
		
		shootingcount = rand_range(20, 70)
