# Used ChatGPT on 2/11/2025 to get the code for collecting objects when clicked on them.
# Prompt: I add 4 coconuts to the inventory and display them in a scene. On the top left, 
# I want the coconut inventory to be displayed as 4. When the player clicks on a coconut 
# it should disappear from the scene and be shown as collected.

extends Area2D

@export var item_name: String  # Set this in the Inspector for each item

signal collected(object)

func _ready():
	input_pickable = true  # Enable input detection
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var normalized_name = item_name.to_lower()  # Convert to lowercase
		emit_signal("collected", self)
		queue_free()  # Remove item from scene

		# Update collected count in beach.gd
		var beach = get_tree().current_scene
		if beach and beach.has_method("collect_item"):
			beach.collect_item(normalized_name)
