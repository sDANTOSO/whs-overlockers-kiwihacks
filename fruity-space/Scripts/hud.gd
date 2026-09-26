extends Control

const heart = preload("res://Scenes/heart.tscn")

var hearts = []


func _ready() -> void:
	for i in range(0, Globals.max_possible_health):
		hearts.append(heart.instantiate())
		hearts[i].position = Vector2(i * 20 + 20, 30)
		self.add_child(hearts[i])
		
func display_health(health: int):
	for i in range (0, health):
		hearts[i].show()
	for i in range (health, hearts.size()):
		hearts[i].hide()
