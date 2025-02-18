extends ColorRect

@onready var spotlight_material = material

func _process(delta):
	if spotlight_material:
		var viewport_size = get_viewport_rect().size
		var normalized_mouse_pos = get_viewport().get_mouse_position() / viewport_size  # Normalize
		print("Mouse Pos:", normalized_mouse_pos)
		spotlight_material.set_shader_parameter("mouse_pos", normalized_mouse_pos)
