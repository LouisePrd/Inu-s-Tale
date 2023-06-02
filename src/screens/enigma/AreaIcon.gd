extends Area2D

export (NodePath) var parchment

func _ready():
	parchment = get_node(parchment)
	parchment.visible = false
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	if parchment.visible == true:
		parchment.visible = false
	elif parchment.visible == false:
		parchment.visible = true
