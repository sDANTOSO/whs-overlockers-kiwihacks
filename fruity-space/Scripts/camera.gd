extends Node2D # Or Camera2D

@export var target: Node2D
@export var follow_speed: float = 5.0

func _ready() -> void:
	set_as_top_level(true)

func _physics_process(delta: float) -> void:
	if not target:
		return
		
	var target_pos = target.global_position 
	var target_rotation = target.global_rotation
	
	var weight = 1.0 - exp(-follow_speed * delta)
	
	global_position = global_position.lerp(target_pos, weight)
	
	rotation = target_rotation
