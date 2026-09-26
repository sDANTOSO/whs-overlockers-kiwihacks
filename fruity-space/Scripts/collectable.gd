extends Area2D

var collected: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.new_collectable();
	self.body_entered.connect(collision);

func collision(body: Node2D):
	#print("col: "+ body.name+" : "+ str(body.is_in_group("Player")));
	if body.is_in_group("Player"):
		collect_anim();

func collect_anim():
	if !collected:
		collected = true;
		print("Collected!");
		$AnimationPlayer.play("Collect");
		# increase global amount collected here
		Globals.reduce_collectables();


func collect_apply():
	# destroy the collectable
	queue_free();
