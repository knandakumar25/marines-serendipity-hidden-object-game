extends ColorRect

@onready var spotlight_material = material

func _process(delta):
	if spotlight_material:
		spotlight_material.set_shader_parameter("mouse_pos", get_viewport().get_mouse_position())
