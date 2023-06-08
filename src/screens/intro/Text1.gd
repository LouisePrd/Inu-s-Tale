extends RichTextLabel


export (NodePath) var text2


# Called when the node enters the scene tree for the first time.
func _ready():
	text2 = get_node(text2)
	text2.visible = false
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Enter"):
		if self.visible == true:
			self.visible = false
			text2.visible = true
		elif text2.visible == true:
			text2.visible = false
			text2.launchTimer()
