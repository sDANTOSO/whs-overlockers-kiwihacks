extends Node2D

@export var target_player: CharacterBody2D

func _physics_process(_delta: float) -> void:
	if target_player:
		# Force the pivot to perfectly copy the player's position and rotation
		global_position = target_player.global_position
		global_rotation = target_player.global_rotation
