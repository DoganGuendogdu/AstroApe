extends Area2D

const BANANA_SPEED = 200

var banana_direction_x=1		#Richtung der Banane


var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)

# Setze Bewegung fuer Banane
func _process(delta):
	#Vector2(Bananenrichtung, y Wert =0) * Geschwindigkeit
	var motion = Vector2(banana_direction_x, 0) * BANANA_SPEED
	
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
	
	
	
