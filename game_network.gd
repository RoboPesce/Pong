extends Node2D

const DEFAULT_IP = 'ec2-3-81-142-152.compute-1.amazonaws.com' # '3.81.142.152'
const DEFAULT_PORT = 4242

func _ready():
	print("preparing to join")
	
	get_tree().connect("connected_to_server",       self,        "_connected_ok")
	get_tree().connect("connection_failed",         self,      "_connected_fail")
	get_tree().connect("server_disconnected",       self,   "_server_disconnect")
	get_tree().connect("network_peer_connected",    self,    "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	join_server()

func join_server():
	var host = NetworkedMultiplayerENet.new()
	
	print("attempting to join server")
	host.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(host)

func _connected_ok():
	$PlayerPaddle.name = str(get_tree().get_network_unique_id())
	print("connected to server")

func _connected_fail():
	print("Failed to connect to server, either down or full")
	get_tree().set_network_peer(null)
	get_tree().change_scene("res://Lobby.tscn")

func _server_disconnect():
	pass

remote func set_other_player_id(id):
	if id == -1:
		print("other player disconnected")
		get_node(str(globals.otherPlayerId)).queue_free()
		globals.otherPlayerId = -1
		return
	# else just store and create new paddle
	globals.otherPlayerId = id
	print("other id set to " + str(id) + ", creating paddle")
	# add other paddle
	var mpaddle = preload("res://paddle_multiplayer.tscn").instance()
	mpaddle.name = str(id)
	mpaddle.control = false
	mpaddle.position = Vector2(750, 300)
	add_child(mpaddle)

remote func is_host():
	pass # CREATE BALL AND DO LOGIC FOR THIS

remote func reset_game():
	print("game reset")

func _player_connected(id):
	pass

func _player_disconnected(id):
	pass

func _on_TextureButton_pressed():
	get_tree().set_network_peer(null)
	get_tree().change_scene("res://Lobby.tscn")
