extends Control
@onready var planet_v_2: Sprite2D = $PlanetV2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	planet_v_2.rotation= planet_v_2.rotation+0.0005
	
