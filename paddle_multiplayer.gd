extends KinematicBody2D

const SPEED = 250

var control = true
var move_dir = 0

var should_send = true

func _physics_process(delta):
	if control:
		if Input.is_action_pressed("l_up"):
			move_dir = -1
		elif Input.is_action_pressed("l_down"):
			move_dir = 1
		else: move_dir = 0
		
		position.y = clamp(position.y, 0, 600)
		var movement = Vector2(0, move_dir * SPEED * delta)
		move_and_collide(movement)
		if (globals.otherPlayerId > 1) and (should_send):
			rpc_unreliable_id(globals.otherPlayerId, "do_move", position.y)
		should_send = !should_send

remote func do_move(y_pos):
	position.y = y_pos
	
