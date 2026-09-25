extends CharacterBody2D


@export var SPEED:float = 300;
var theta:float = 0;
var magnitude:float = 1200;
@export var jump_velocity = 5;
@export var G = 10000000;
@onready var shapecast = $ShapeCast2D

var magnitude_velocity = 0;

func _ready() -> void:
	theta = wrapf(theta, 0, TAU)
	rotation = theta + PI/2
	position = Vector2(
		magnitude * cos(theta),
		magnitude * sin(theta)
	)


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	
		
	if not shapecast.is_colliding():
		var A = G / max(magnitude * magnitude, 0.1)
		magnitude_velocity += A * delta
	else:
		if Input.is_action_pressed("ui_accept"):
			magnitude_velocity -= jump_velocity
		else: 
			magnitude_velocity = 0.0
		
	print(magnitude_velocity)
	magnitude -= magnitude_velocity
	
	var angular_speed = SPEED / max(magnitude, 0.1)
	var next_theta = theta + (direction * angular_speed * delta)
	next_theta = wrapf(next_theta, 0, TAU)
	
	var target_position = Vector2(
		magnitude * cos(next_theta),
		magnitude * sin(next_theta)
	)
	
	velocity = (target_position - position) / delta
	
	if move_and_slide():
		theta = position.angle()
		rotation = theta + PI/2
	else:
		theta = next_theta
		rotation = theta + PI/2
