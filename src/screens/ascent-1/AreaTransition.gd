extends Area2D

export var scene : PackedScene

func _on_Area2DTransition_body_entered(body) -> void:
	if body.is_in_group("NPC"):
		return
		
	Transition.transition_to(scene.resource_path)
