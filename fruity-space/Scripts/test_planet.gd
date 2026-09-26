extends Node
@onready var camera_2d: Camera2D = $Camera/Camera2D
@export var circle_radius:int = 1024
@onready var planet_v_2: Sprite2D = $PlanetV2
@onready var hud: HUD = $Camera/Camera2D/CanvasLayer/HUD

func _ready() -> void:
	hud.visible = false
	camera_2d.make_current()
	camera_2d.position.x = -183
	camera_2d.position.y = 1308
	camera_2d.zoom.x = 5
	camera_2d.zoom.y = 5
	planet_v_2.rotation= planet_v_2.rotation+0.0005
	Globals.planet_rotation = planet_v_2.rotation
	##sawait get_tree().create_timer(2.0).timeout
	var tween = create_tween()
	tween.tween_property(camera_2d, "position", Vector2(0, 0), 2.0).set_trans(Tween.TRANS_CUBIC)
	zoom_out()
	await get_tree().create_timer(2.0).timeout
	hud.visible= true
	
func zoom_out() -> void:
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(1, 1), 2.0).set_trans(Tween.TRANS_CUBIC)
	##camera_2d.position.x = 0
	##camera_2d.position.y = 0
	##camera_2d.zoom.x = 5
	##camera_2d.zoom.y = 5
	

	
func _process(delta: float) -> void:
	pass
	##print($PlanetV2.position.x)
	##print($PlanetV2.position.y)
	#camera_2d.position.x = 600
	#camera_2d.position.y = 1337
	#camera_2d.zoom.x = 0.35
	#camera_2d.zoom.y = 0.35
	
