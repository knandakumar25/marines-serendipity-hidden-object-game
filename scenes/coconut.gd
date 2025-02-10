extends Area2D

# Signal to emit when collected
signal collected(object)

func _ready():
	# Connect the input event signal
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		# Make the object visible
		self.visible = true
		queue_free()
		# Optionally, you can emit a signal if needed
		emit_signal("collected", self)
