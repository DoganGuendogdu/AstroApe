extends Control

#var score = 0 setget setScore

#onready var score_label = $hud/TextureRect/punkte
#onready var score_rect = $hud/TextureRect

#func showScore(value):
#	score_rect.rect_size.x = Global.score *15

#func setScore(value):
#	score = Global.score
#	score_label.text = "Health: " + str(score)


# Called when the node enters the scene tree for the first time.
#func _ready():
#	self.score = Global.score
#	Global.connect("score_changed", self, "showScore")
#	score_rect.rect_size.x = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
