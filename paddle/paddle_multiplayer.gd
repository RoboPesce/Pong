extends "res://paddle/paddle_base.gd"

var control : bool = true
var server_y_pos : int = 300

func read_input() -> void:
	if not control: return
	
	if Input.is_action_pressed("l_up"):
		move_dir = -1
	elif Input.is_action_pressed("l_down"):
		move_dir = 1
	else: move_dir = 0
	
	# TODO: Send input to server
	#if (globals.otherPlayerId > 1):
	#	rpc_unreliable_id(globals.otherPlayerId, "do_move", position.y)

func update_position(delta: float) -> void:
	if control:
		var movement = Vector2(0, move_dir * SPEED * delta)
		move_and_collide(movement)

remote func do_move(y_pos):
	position.y = y_pos
