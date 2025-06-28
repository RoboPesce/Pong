extends Node2D

func _ready():
	pass

func _on_LocalButton_pressed():
	get_tree().change_scene("res://LocalWorld.tscn")

func _on_JoinButton_pressed():
	get_tree().change_scene("res://MultiWorld.tscn")
