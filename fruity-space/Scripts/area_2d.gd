extends Area2D

@export var player: Node2D 

func _ready() -> void:
	self.body_entered.connect(collision);

func collision(body: Node2D):
	if body.is_in_group("Player"):
		print("Player IN");
		player.handle_damage()
