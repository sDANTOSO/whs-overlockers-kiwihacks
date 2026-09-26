extends Control

const GAME_SCENE = preload("res://Scenes/level1.tscn")

@onready var planet_v_2: Sprite2D = $PlanetV2
@onready var camera_2d: Camera2D = $Camera2D
@onready var logov_1: Sprite2D = $Logov1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	logov_1.position.x= logov_1.position.x+0.1
	planet_v_2.rotation= planet_v_2.rotation+0.0005
	Globals.planet_rotation =planet_v_2.rotation


func _on_play_button_pressed() -> void:
	
	var tween = create_tween()
	zoom_out()
	tween.tween_property(camera_2d, "position", Vector2(600, 1337), 4.0).set_trans(Tween.TRANS_CUBIC)
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_packed(GAME_SCENE)
func zoom_out() -> void:
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(0.35, 0.35), 4.0).set_trans(Tween.TRANS_CUBIC)
	await get_tree().create_timer(5.0).timeout
	zoom_in()
	
func zoom_in() -> void:
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(5, 5), 3).set_trans(Tween.TRANS_CUBIC)
