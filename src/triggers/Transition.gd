extends Area2D

export var scene : PackedScene

# Transition si un corps autre que ceux dans le groupe NPC entre dans la zone de l'élément
func _on_Area2DTransition_body_entered(body) -> void:
	if body.is_in_group("NPC"):
		return
		
	Transition.transition_to(scene.resource_path)

