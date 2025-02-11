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
extends Node

var collected_items = {
	"coconut": 0,
	"fish": 0,
	"axe": 0,
	"sickle": 0
}
var total_items = {
	"coconut": 4,
	"fish": 4,
	"axe": 1,
	"sickle": 1
}

@onready var collected_label = get_node("UI/CollectedLabel")  # Ensure this path is correct

func _ready():
	update_collected_display()

func collect_item(item_name):
	item_name = item_name.to_lower()  # Ensure consistency

	if item_name in collected_items:
		collected_items[item_name] += 1
		update_collected_display()
	else:
		print("⚠ ERROR: Key '" + item_name + "' not found in collected_items!")

func update_collected_display():
	if not collected_label:
		return

	var display_text = "Collected: "  # Start the line with "Collected:"

	# Loop through each item and add its count to the display text
	for item in collected_items.keys():
		display_text += item.capitalize() + ": " + str(collected_items[item]) + "/" + str(total_items[item]) + "  "

	# Set the collected label text to show all items on the same line
	collected_label.text = display_text
