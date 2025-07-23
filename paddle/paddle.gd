extends "res://paddle/paddle_base.gd"

export(bool) var is_left

func read_input() -> void:
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

func update_position(delta: float) -> void:
	position.y = clamp(position.y, 0, 600)
	var movement : Vector2 = Vector2(0, move_dir * SPEED * delta)
	move_and_collide(movement)
