extends Sprite

export (NodePath) var examinerTexte
onready var _area: Area2D = $Area2D

func _ready() -> void:
	examinerTexte = get_node(examinerTexte);
	examinerTexte.visible = false
	_area.connect("body_entered", self, "_on_Area2D_body_entered")
	_area.connect("body_exited", self, "_on_Area2D_body_exited")

# Gestion de l'affichage quand le joueur passe devant élément
func _on_Area2D_body_entered(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
		print(body.name)
		if examinerTexte.visible == false:
			examinerTexte.visible = true
			
			
# Gestion de l'affichage quand le joueur sort de la zone de l'élément
func _on_Area2D_body_exited(body) -> void:
	if body.name == "Player1" or body.name == "Player2":
		print(body.name)
		if examinerTexte.visible == true:
			examinerTexte.visible = false
