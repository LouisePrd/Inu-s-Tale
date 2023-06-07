extends Camera2D

export (NodePath) var object1
export (NodePath) var object2

func _ready():
	object1 = get_node(object1)
	object2 = get_node(object2)

func _process(_delta):
	# Position du node Camera par rapport à la fenêtre de jeu -> en bas de la fenêtre
	self.global_position = (object1.global_position + object2.global_position) * 0.5
	
	# Zoom du node Camera distance entre le node Player1 et le node Player2 relatifs à la fenêtre de jeu + limite du zoom
	var zoom_factor1 = abs(object1.global_position.x-object2.global_position.x)/(1920)
	var zoom_factor2 = abs(object1.global_position.y-object2.global_position.y)/(600)
	var zoom_factor = max(max(zoom_factor1, zoom_factor2), 0.4)

	self.zoom = Vector2(zoom_factor, zoom_factor)
