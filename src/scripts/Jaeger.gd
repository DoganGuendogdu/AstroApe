extends KinematicBody2D

const UP = Vector2(0,-10)
const GRAVITY 		= 20 
const ACCELARATION 	= 200
const MAX_SPEED 	= 50
const JUMP_HEIGHT 	= -500


const HUNTING = "hunting"
const PATROLING = "patroling"
const LEFT =-1
const RIGHT =1

var direction = LEFT

var state = PATROLING
var player = null
var motion = Vector2()
var playerpos = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_character()
	#move_test()
	detect_obstacle()

func move_character():
	motion.y += GRAVITY
	if state == HUNTING:
		#print("hunt")
		hunt_player()
	if state == PATROLING:
		#print("patrol")
		patrol()
	motion = move_and_slide(motion, UP)
	
func hunt_player():
	if position.direction_to(player.position).x <=0 and direction == RIGHT:
		print("change direction to left")
		direction = LEFT
		$Node2D.scale = Vector2(1,1)
	if position.direction_to(player.position).x >0 and direction == LEFT:
		print("change direction to right")
		direction = RIGHT
		$Node2D.scale = Vector2(-1,1)
	#if direction == LEFT:
		#$Node2D.scale = Vector2(1,1)
		#scale = Vector2(1,1)
		#scale.x *=-scale.x
	#if direction == RIGHT:
		#$Node2D.scale = Vector2(-1,1)
		#scale = Vector2(-direction,1)
		#scale.x *=-scale.x
	move()
	
func patrol():
	move()
		
func move():
	var speed = motion.x + ACCELARATION
	if direction ==LEFT:
		motion.x = max(speed*direction, MAX_SPEED*direction)
	if direction == RIGHT:
		motion.x = min(speed*direction, MAX_SPEED*direction)
	
	
#pruefe ob sich vor dem Spieler ein Hindernis befindet, falls ja: springen
func detect_obstacle():
	if state == PATROLING:
		if get_node("Node2D/RayCast2D").is_colliding():
		#if $RayCast2D.is_colliding():
			if is_on_floor():
				#motion.y = JUMP_HEIGHT
				direction *=-1
				scale.x *=-1
	if state == HUNTING:
		 
		if get_node("Node2D/RayCast2D").is_colliding():
		#if $RayCast2D.is_colliding():
			if is_on_floor():
			#scale.x =1
				motion.y = JUMP_HEIGHT

#Jaeger entdeckt Spieler
func _on_Area2D_body_entered(body):
	#if body != self:
	if body.get_name() == "Player":
		player = body
		state = HUNTING
	else:
		pass
