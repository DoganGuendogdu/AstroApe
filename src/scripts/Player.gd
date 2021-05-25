extends KinematicBody2D

const UP = Vector2(0,-10)
const GRAVITY 		= 20 
const ACCELARATION 	= 300
const MAX_SPEED 	= 200
const JUMP_HEIGHT 	= -500
const BANANA_SCENE  = preload("res://AstroApe/src/tscn/Banana.tscn") 


var motion = Vector2()
onready var timer = get_node("Timer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	# gravity
	motion.y += GRAVITY
	
	# Reibung zum verlangsamen
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		# weise motion.x den kleineren Wert von beiden zu
		# Wenn Motion groesser als das Max_Speed ist, 
		# so setze Motion auf Max_speed fest
		motion.x = min(motion.x + ACCELARATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELARATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	
	else:
		# ansonsten bleibe stehen
		# starte von x und nähere sich der 0 mit einer
		# Geschwindigkeitsredzierung von 20 prozent pro Frame
		friction  = true
		$Sprite.play("idle")
	
	# Wenn Figur auf Boden	
	if is_on_floor():
		# ueberpruefe, ob gesprungen wird	
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		
		# Auf Boden Reibung bei 20 Prozent
		if friction == true: 
			motion.x = lerp(motion.x, 0, 0.2)
					
	# Wenn Figur in der Luft
	else:
		# nach oben springend
		if motion.y < 0:
			$Sprite.play("jump")
		# nach unten fallend
		else:
			$Sprite.play("fall")		
			
		# In der Luft Reibung bei 5 Prozent
		if friction == true: 
			motion.x = lerp(motion.x, 0, 0.05)
	
	# Setze Bewegung bei Collision auf 0,0
	motion = move_and_slide(motion, UP)
	
	
	# Bei Space/Enter schiesse Banane
	if Input.is_action_pressed("ui_accept"):
		#if !timer.is_active():
		if timer.is_stopped():
			create_banana()
			timer.start()
		
		
	

# Erstelle Banane
func create_banana():
	# Instanziere die Bananen-Szene
	var banana = BANANA_SCENE.instance()
		 
	# Fuege die Szene dem Elternknoten hinzu
	get_parent().add_child(banana)
	
	# Setzte Position der Banane auf den Position2D	 
	banana.position = get_node("Position2D").global_position
	
	
	
