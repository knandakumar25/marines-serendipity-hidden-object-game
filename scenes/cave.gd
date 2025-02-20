# Used ChatGPT on 2/11/2025 to get the code for collecting objects when clicked on them.
# Prompt: I add 4 coconuts to the inventory and display them in a scene. On the top left, 
# I want the coconut inventory to be displayed as 4. When the player clicks on a coconut 
# it should disappear from the scene and be shown as collected.
# Used ChatGPT on 2/14/2025 to get the code for setting timer and reseting this scene after either
# success or failure of mission
extends Node

var collected_items = {
	"torn page": 0,
	"varuna scripture": 0,
	"water": 0
}
var total_items = {
	"torn page": 1,
	"varuna scripture": 1,
	"water": 1
}

@onready var collected_label = get_node("UI/CollectedLabel")
@onready var timer = $Timer
@onready var message_label = get_node("UI/MessageLabel")
@onready var timer_label = get_node("UI/TimerLabel")

func _ready():
	update_collected_display()
	timer.wait_time = 25
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
func _process(delta: float) -> void:
	update_timer_display()

func collect_item(item_name):
	item_name = item_name.to_lower()  # Ensure consistency

	if item_name in collected_items:
		collected_items[item_name] += 1
		update_collected_display()
		check_completion()
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

func update_timer_display():
	if timer_label:
		timer_label.text = "Time left: " + str(int(timer.time_left)) + "s"

func check_completion():
	for item in collected_items.keys():
		if collected_items[item] < total_items[item]:
			return
	message_label.text = "Success! You have successfully survived. To be continued..."
	await get_tree().create_timer(10.0).timeout
	get_tree().quit()

func _on_timer_timeout():
	message_label.text = "Time's up! Restarting..."
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()
