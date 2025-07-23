extends KinematicBody2D

const SPEED : float = 250.0
var move_dir : int = 0

func _physics_process(delta):
	read_input()
	update_position(delta)
	
func read_input() -> void:
	push_error("Calling paddle_base read_input implementation.")
	
func update_position(delta: float) -> void:
	push_error("Calling paddle_base update_position implementation.")
