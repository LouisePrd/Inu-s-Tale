extends RichTextLabel

export var scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func launchTimer():
	if not $Timer.is_connected("timeout", self, "transition"):
		$Timer.connect("timeout", self, "transition")
		$Timer.start()
		

func transition():
	self.visible = false
	Transition.transition_to(scene.resource_path)
	
