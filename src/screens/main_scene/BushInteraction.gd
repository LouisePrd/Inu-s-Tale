extends Sprite

export var line_color := Color.white

onready var _tween: Tween = $Tween
onready var _area: Area2D = $Area2D


func _ready() -> void:
	_area.connect("body_entered", self, "_on_Area2D_body_entered")
	_area.connect("body_exited", self, "_on_Area2D_body_exited")
	line_color.a = 0


func _on_Area2D_body_entered(_body) -> void:
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 1.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	_tween.start()
	Transition.transition_to("res://src/screens/cataclysm/Cataclysm.tscn")


func _on_Area2D_body_exited(_body) -> void:
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 0.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	_tween.start()


func outline_alpha(value: float) -> void:
	line_color.a = value
	material.set_shader_param("line_color", line_color)

