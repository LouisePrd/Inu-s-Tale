extends Sprite

export (NodePath) var examinerTexte
export (NodePath) var canvasInteraction
onready var _area: Area2D = $Area2D

func _ready() -> void:
	examinerTexte = get_node(examinerTexte);
	canvasInteraction = get_node(canvasInteraction);
	examinerTexte.visible = false
	_area.connect("body_entered", self, "_on_Area2D_body_entered")
	_area.connect("body_exited", self, "_on_Area2D_body_exited")

func _on_Area2D_body_entered(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
		if examinerTexte.visible == false and canvasInteraction.visible == true:
			examinerTexte.visible = true

func _on_Area2D_body_exited(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
		if examinerTexte.visible == true:
			examinerTexte.visible = false
			
func _input(event):
	if event.is_action_pressed("Enter"):
		if examinerTexte.visible == true:
			examinerTexte.visible = false
			canvasInteraction.play()
			
			
