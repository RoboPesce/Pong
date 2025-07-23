extends Node

var otherPlayerId = -1
var ip : String = "127.0.0.1"
var port : int = 4242

func _ready():
	load_config()

func load_config() -> void:
	var config = ConfigFile.new()
	if config.load("res://config.cfg") == OK:
		ip = config.get_value("network", "server_ip", ip)
		port = config.get_value("network", "server_port", port)
