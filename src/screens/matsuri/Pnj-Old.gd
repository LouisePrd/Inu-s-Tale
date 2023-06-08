extends Sprite

onready var _area: Area2D = $Area2D
export (NodePath) var canvasLayer

var enter = false
var visibility = false

func _ready() -> void:
	_area.connect("body_entered", self, "_on_Area2D_body_entered")
	_area.connect("body_exited", self, "_on_Area2D_body_exited")
	canvasLayer = get_node(canvasLayer);
	canvasLayer.visible = false

func _on_Area2D_body_entered(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
		canvasLayer.visible = true
		enter = true

func _on_Area2D_body_exited(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
			canvasLayer.visible = false
			
func _input(event):
	if event.is_action_pressed("Enter") and canvasLayer.visible == true:
		canvasLayer.visible = false
