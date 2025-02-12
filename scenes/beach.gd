# Used ChatGPT on 2/11/2025 to get the code for collecting objects when clicked on them.
# Prompt: I add 4 coconuts to the inventory and display them in a scene. On the top left, 
# I want the coconut inventory to be displayed as 4. When the player clicks on a coconut 
# it should disappear from the scene and be shown as collected.
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
