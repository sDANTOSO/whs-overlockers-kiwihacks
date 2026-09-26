extends Area2D

@export var player: Node2D 
var activated := false

func _ready() -> void:
	self.body_entered.connect(collision);

func collision(body: Node2D):
	if body.is_in_group("Player") and not activated :
		print("Player IN")
		activated = true
		player.set_checkpoint(global_position)
