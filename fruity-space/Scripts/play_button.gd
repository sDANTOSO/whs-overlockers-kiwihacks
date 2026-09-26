extends TextureButton
@onready var play_button: TextureButton = $"."
const GAME_SCENE = preload("res://Scenes/start.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(GAME_SCENE)



func _on_mouse_entered() -> void:
	play_button.scale.x=4.9
	play_button.scale.y=4.9 



func _on_mouse_exited() -> void:
	play_button.scale.x=4.5
	play_button.scale.y=4.5
