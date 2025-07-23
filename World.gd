extends Node2D

onready var LScore = $LScore
onready var RScore = $RScore

func _on_Ball_l_score():
	LScore.text = str(int(LScore.text) + 1)

func _on_Ball_r_score():
	RScore.text = str(int(RScore.text) + 1)

func _on_EndButton_pressed():
	get_tree().change_scene("res://lobby/Lobby.tscn")
