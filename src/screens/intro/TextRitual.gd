extends RichTextLabel


export (NodePath) var TextRitual2
export (NodePath) var inugami
export (NodePath) var boom



# Called when the node enters the scene tree for the first time.
func _ready():
	TextRitual2 = get_node(TextRitual2)
	inugami = get_node(inugami)
	boom = get_node(boom)
	TextRitual2.visible = false
	inugami.visible = false
	boom.visible = false
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Enter"):
		if self.visible == true:
			self.visible = false
			TextRitual2.visible = true
			TextRitual2.visible = true
			boom.visible=true
		elif TextRitual2.visible == true:
			TextRitual2.visible = false
			inugami.visible = true
			boom.visible= false
			TextRitual2.launchTimer()
