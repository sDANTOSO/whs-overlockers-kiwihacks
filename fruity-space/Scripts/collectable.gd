extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(collision);

func collision(body: Node2D):
	if body.is_in_group("player"):
		collect();

func collect():
	queue_free();
