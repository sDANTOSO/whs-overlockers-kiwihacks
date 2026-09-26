extends Control
@onready var planet_v_2: Sprite2D = $PlanetV2
@onready var camera_2d: Camera2D = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	planet_v_2.rotation= planet_v_2.rotation+0.0005
	


func _on_play_button_pressed() -> void:
	
	var tween = create_tween()
	zoom_out()
	tween.tween_property(camera_2d, "position", Vector2(600, 1337), 4.0).set_trans(Tween.TRANS_CUBIC)
	##tween.tween_property(camera_2d, "zoom", Vector2(0.35, 0.35), 4.0)
	
func zoom_out() -> void:
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(0.35, 0.35), 4.0).set_trans(Tween.TRANS_CUBIC)
