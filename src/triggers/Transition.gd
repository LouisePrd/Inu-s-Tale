extends Area2D

export var scene : PackedScene

func _on_Area2DTransition_body_entered(body) -> void:		
	Transition.transition_to(scene.resource_path)
