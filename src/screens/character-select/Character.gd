extends Sprite

export var line_color := Color.white

onready var _tween: Tween = $Tween

func _ready() -> void:
	line_color.a = 0
	

func _on_ButtonNao_focus_entered():
	line_color = '#c3b473'
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 1.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	_tween.start()


func _on_ButtonNao_focus_exited():
	line_color = '#c3b473'
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 0.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	_tween.start()


func _on_ButtonInu_focus_entered():
	line_color = '#24a7da'
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 1.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	_tween.start()


func _on_ButtonInu_focus_exited():
	line_color = '#24a7da'
	_tween.interpolate_method(
		self, "outline_alpha", line_color.a, 0.0, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	_tween.start()
	
	
func outline_alpha(value: float) -> void:
	line_color.a = value
	material.set_shader_param("line_color", line_color)
