extends KinematicBody2D

const UP = Vector2(0,-10)
const GRAVITY 		= 20 
const ACCELARATION 	= 200
const MAX_SPEED 	= 50
const JUMP_HEIGHT 	= -500

var player = null
var motion = Vector2()
var playerpos = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	move_character()
	detect_obstacle()
	
func move_character():
	motion.y += GRAVITY
	#laufe nach links
	motion.x = max(motion.x - ACCELARATION, -MAX_SPEED)
	#wenn Gegner Spieler bemerkt hat
	if player != null:
		#hole Spielerposition
		playerpos = position.direction_to(player.position)
		
		#motion.x = max(playerpos.x +ACCELARATION ,-MAX_SPEED)
		#motion.x = playerpos.x*MAX_SPEED
		
		#bewegung in Richtung Spieler
		motion.x = max(position.direction_to(player.position).normalized().x*MAX_SPEED,-MAX_SPEED)
		#drehe nach rechts
		if motion.x <=0:
			#scale.x = 1
			$Sprite.flip_h = false
			$RayCast2D.enabled = true
			$RayCast2D2.enabled = false
		#drehe nach links
		elif motion.x >0:
			#scale.x = -1
			$Sprite.flip_h = true
			$RayCast2D.enabled = false
			$RayCast2D2.enabled = true
	else:
		motion.x = max(motion.x - ACCELARATION, -MAX_SPEED)
	motion = move_and_slide(motion, UP)
	#motion = move_and_collide(motion)

#pruefe ob sich vor dem Spieler ein Hindernis befindet, falls ja: springen
func detect_obstacle():
	if $RayCast2D.is_colliding():
		if is_on_floor():
			motion.y = JUMP_HEIGHT
	if $RayCast2D2.is_colliding():
		if is_on_floor():
			motion.y = JUMP_HEIGHT

#Jaeger entdeckt Spieler
func _on_Area2D_body_entered(body):
	if body != self:
		player = body
