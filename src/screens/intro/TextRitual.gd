extends RichTextLabel


export (NodePath) var TextRitual2


# Called when the node enters the scene tree for the first time.
func _ready():
	TextRitual2 = get_node(TextRitual2)
	TextRitual2.visible = false
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Enter"):
		if self.visible == true:
			self.visible = false
			TextRitual2.visible = true
		elif TextRitual2.visible == true:
			TextRitual2.visible = false
			TextRitual2.launchTimer()
