extends Node2D

var score = 0 setget set_score

var highscore = 0

signal score_changed

func set_score(value):
	score = value
	emit_signal("score_changed", score)