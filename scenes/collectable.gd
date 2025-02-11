# Used ChatGPT on 2/11/2025 to get the code for collecting objects when clicked on them.
# Prompt: Using the files below, can you make it so that I add 4 coconuts to the inventory and display them in a scene. On the top left, I want the coconut inventory to be displayed as 4. When the player clicks on a coconut it should disappear from the scene and be shown as collected. beach.gd:
#extends Node
#
#@export var item: InvItem
#var player = null
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#player = get_node("Player")
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#player.collect(item)
#
#coconut.gd:
#extends Area2D
#
## Signal to emit when collected
#signal collected(object)
#
#func _ready():
	## Connect the input event signal
	#connect("input_event", Callable(self, "_on_input_event"))
#
#func _on_input_event(_viewport, event, _shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		## Make the object visible
		#self.visible = true
		#queue_free()
		## Optionally, you can emit a signal if needed
		#emit_signal("collected", self)

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
