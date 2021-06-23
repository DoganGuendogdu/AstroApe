extends Label

var score = 0 setget set_Score

func _ready():
	Global.hudHighScore = self

func set_Score(value):
	score = value
	Global.hudHighScore.set_text(str(score))
	
	if score > Global.highscore:
		Global.set_highscore(score)
		print("highscore")

