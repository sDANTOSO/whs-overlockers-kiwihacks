extends Node2D

@export var player: Node2D
@export var camera: Node2D

var is_leaving = false

func _ready() -> void:
	self.hide()
	$"../Camera/Camera2D/CanvasLayer/HUD".visible = false
	
func _process(delta: float) -> void:
	if is_leaving:
		position += Vector2.UP.rotated(rotation) * 3

func leave():
	player.hide()
	camera.set_target(self)
	self.show()
	
	is_leaving = true
