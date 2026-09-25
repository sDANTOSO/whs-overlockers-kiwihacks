extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(collision);

func collision(body: Node2D):
	#print("col: "+ body.name+" : "+ str(body.is_in_group("Player")));
	if body.is_in_group("Player"):
		collect();

func collect():
	print("Collected!");
	queue_free();
