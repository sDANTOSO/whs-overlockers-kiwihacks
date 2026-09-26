extends Node2D

@export var player: Node2D
@export var camera: Node2D

var is_leaving = false

func _ready() -> void:
	self.hide()
	
func _process(delta: float) -> void:
	if is_leaving:
		position.y -= 10;

func leave():
	player.hide()
	camera.set_target(self)
	self.show()
	
	is_leaving = true
