extends Node

@onready var texture_rect = $TextureRect
@onready var text_edit = $TextEdit
@onready var text_edit2 = $TextEdit2
@onready var continue_button = $ContinueButton

func _ready():
	get_viewport().connect("size_changed", Callable(self, "_on_resize"))


func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ship.tscn")
