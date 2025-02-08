extends Area2D

# Signal to emit when collected 
signal collected(object)

# Called when the node enters the scene tree for the first time.
var collected_objects = []

func _ready():
	# Other initialization code
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("collected", self)
		queue_free()

# Function to handle collected objects
func _on_collectible_collected(collectible):
	collected_objects.append(collectible)
