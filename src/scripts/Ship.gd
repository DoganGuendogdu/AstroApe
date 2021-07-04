extends KinematicBody2D

var speed = 70
var Velocity = Vector2()


func _ready():
	Global.hudScore.set_text(str(Global.score))
	Global.hudHighScore.set_text(str(Global.highscore))

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		Velocity.x = -speed
	if Input.is_action_just_pressed("ui_right"):
		Velocity.x = speed
	move_and_slide(Velocity)

	if Input.is_action_just_pressed("ui_accept"):
		fire()
		
func fire():
	var bullet = preload("res://AstroApe/src/tscn/Kugel.tscn")
	var firedbullet = bullet.instance()
	firedbullet.position = Vector2(position.x, 0)
	$ShotSound.play()
	get_parent().call_deferred("add_child", firedbullet)
