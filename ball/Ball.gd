extends KinematicBody2D

export (int) var SPEED

signal l_score
signal r_score

onready var start_timer = $startTimer
onready var reset_timer = $resetTimer
onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var movement : Vector2 = Vector2(0, 0)
var speed_multiplier : float = 1
var gaming : bool = false

func _ready():
	rng.randomize()
	start_timer.start()

func _physics_process(delta):
	if not gaming: return
	movement = speed_multiplier * SPEED * movement.normalized()
	move_and_collide(movement)

func _on_Area2D_body_entered(body):
	if body.is_in_group("vertbounds"):
		movement.y = - movement.y
	elif body.is_in_group("paddles"):
		movement.x = - movement.x
		speed_multiplier = 1 + ( randi() % 8 / 10.0 )
	elif body.is_in_group("horbounds"):
		gaming = false
		if body.is_in_group("leftbound"): emit_signal("r_score")
		else: emit_signal("l_score")
		
		reset_timer.start()

func _on_resetTimer_timeout():
	position = Vector2(400, 300)
	start_timer.start()

func _on_startTimer_timeout():
	var random_dir = pow(-1, randi() % 2)
	var x_vel = rng.randi_range(7, 10)
	var y_vel = rng.randi_range(1, 4)
	movement = Vector2(x_vel * random_dir, y_vel).normalized()
	
	gaming = true
