extends KinematicBody2D

const SPEED = 250

export(bool) var is_left
var move_dir = 0

func _physics_process(delta):
	if is_left:
		if Input.is_action_pressed("l_up"):
			move_dir = -1
		elif Input.is_action_pressed("l_down"):
			move_dir = 1
		else: move_dir = 0
	else:
		if Input.is_action_pressed("r_up"):
			move_dir = -1
		elif Input.is_action_pressed("r_down"):
			move_dir = 1
		else: move_dir = 0
	
	position.y = clamp(position.y, 0, 600)
	var movement = Vector2(0, move_dir * SPEED)
	move_and_collide(movement)
	
