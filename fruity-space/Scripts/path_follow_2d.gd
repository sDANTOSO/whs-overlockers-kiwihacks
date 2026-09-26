extends PathFollow2D

@export var speed = -0.4

func _ready() -> void:
		progress_ratio = 0.5


func _process(delta: float) -> void:
	if progress_ratio >= 0.9 or progress_ratio <= 0.1:
		speed = -speed
		print("FLIP")


	progress_ratio += speed * delta

		
