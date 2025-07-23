extends Node2D

func _ready():
	if OS.has_feature("server"):
		pass # TODO: Switch to server implementation

func _on_LocalButton_pressed():
	get_tree().change_scene("res://LocalWorld.tscn")

func _on_JoinButton_pressed():
	get_tree().change_scene("res://MultiWorld.tscn")
