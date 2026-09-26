extends TextureButton
@onready var quit_button: TextureButton = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _on_pressed() -> void:
	get_tree().quit()



func _on_mouse_entered() -> void:
	quit_button.scale.x=4.9
	quit_button.scale.y=4.9 



func _on_mouse_exited() -> void:
	quit_button.scale.x=4.5
	quit_button.scale.y=4.5
