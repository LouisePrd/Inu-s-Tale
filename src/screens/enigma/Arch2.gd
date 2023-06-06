extends Sprite

export var line_color := Color.white
export (NodePath) var choixArche
onready var _area: Area2D = $Area2D

var player1_enter = false
var player2_enter = false


func _ready() -> void:
	choixArche = get_node(choixArche)
	_area.connect("body_entered", self, "_on_Area2D_body_entered")
	_area.connect("body_exited", self, "_on_Area2D_body_exited")
	choixArche.visible = false
	outline_alpha(0)


func _on_Area2D_body_entered(_body) -> void:
	if _body.name == "Player1":
		player1_enter = true
	if _body.name == "Player2":
		player2_enter = true
		
	if player1_enter == true and player2_enter == true:
		outline_alpha(10)
		choixArche.visible = true


func _on_Area2D_body_exited(_body) -> void:
	if _body.name == "Player1":
		player1_enter = false
	if _body.name == "Player2":
		player2_enter = false
	if _body.name == "Player1" or _body.name == "Player2":
		outline_alpha(0)
		choixArche.visible = false

func outline_alpha(value: float) -> void:
	line_color.a = value
	material.set_shader_param("line_color", line_color)

func _input(event):
	if event.is_action_pressed("Enter"):
		if player1_enter == true and player2_enter == true:
			print(self.name)
		
