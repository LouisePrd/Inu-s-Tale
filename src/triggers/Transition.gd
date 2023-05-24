extends Area2D

export var scene : PackedScene
	
func _on_Area2D_body_entered(_body) -> void:
	Transition.transition_to(scene.resource_path)
