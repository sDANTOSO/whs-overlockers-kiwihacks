extends Node2D

@onready var camera_2d: Camera2D = $Camera/Camera2D
@export var circle_radius:int = 1024
@onready var planet_v_2: Sprite2D = $RigidBody2D/Sprite2D
@onready var hud: HUD = $Camera/Camera2D/CanvasLayer/HUD
@onready var platforms: Node2D = $Platforms
##@onready var rocket: Sprite2D = $Rocket

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
	tween.tween_property(camera_2d, "position", Vector2($Player.position.x, $Player.position.y), 2.0).set_trans(Tween.TRANS_CUBIC)
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
	
	
	## on signal
	## zoom out of planet 
	var tween = create_tween()
	tween.tween_property(camera_2d, "position", Vector2(600, 1337), 4.0).set_trans(Tween.TRANS_CUBIC)
	zoom_outend()
	##hide brown stuff in betwen
	await get_tree().create_timer(3).timeout
	platforms.visible = false
	##change start 
	
	##rotate of planet
	planet_v_2.rotation= planet_v_2.rotation+0.0005
	Globals.planet_rotation =planet_v_2.rotation
	##rocket instantly shoots off
	
	## game ends with planet rotating 
	
func zoom_outend() -> void:
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(0.35, 0.35), 4.0).set_trans(Tween.TRANS_CUBIC)
