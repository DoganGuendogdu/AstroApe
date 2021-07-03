extends Node2D

var score = 0 
#setget set_score

var hudScore
var hudHighScore

var highscore = 0 setget set_highscore
const filepath = "res://highscore.data"


func add_Score(value):
	if value + score< highscore:
		score += value
	else:
		set_highscore(value+score)

func reset_Score():
	score=0
	

func _ready():
	load_highscore()

func load_highscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	highscore = file.get_var()
	file.close()

func save_highscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(highscore)
	file.close()

func set_highscore(new_value):
	highscore = new_value
	score = new_value
	hudHighScore.set_text(str(score))
	save_highscore()
