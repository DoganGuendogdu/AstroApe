extends Area2D

const BANANA_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)

# Setze Bewegung fuer Banane
func _process(delta):
	var speed_x = 1
	var speed_y = 0 
	var motion = Vector2(speed_x, speed_y) * BANANA_SPEED
	
	# Setze Position der Banane
	position = position + motion * delta
	

# Loesche Banane und Gegner wenn getroffen 
func _on_Banana_area_entered(area: Area2D) -> void:
	
	# Verhindert, dass das Portal geloescht wird	
	if area.name != "LevelComplete1":
		queue_free()
		area.queue_free()

	

# Loesche Banane wenn Fenster verlassen
func _on_VisibilityNotifier2D_screen_exited() -> void:
	
	# Loesche sobald wie möglich
	queue_free()
	
	
	
	
	
	
	
	
	
	
	
	
	
