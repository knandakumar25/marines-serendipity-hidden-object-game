extends Node

func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ship.tscn")
