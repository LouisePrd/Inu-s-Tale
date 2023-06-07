extends Area2D

export (NodePath) var player1
export (NodePath) var player2

var active = false
var launch = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect( "body_exited", self, '_on_NPC_body_exited')
	player1 = get_node(player1)
	player2 = get_node(player2)
	
	
# Entrée dans la zone : arret marche et affichage bulles
func _on_NPC_body_entered(body):
	var dialogue_cataclysm = get_node_or_null("DialogueCataclysm")
	if dialogue_cataclysm and launch==false:
		if body. name == 'Player1' or body. name == 'Player2':
			player1.move = false
			player2.move = false
			dialogue_cataclysm.play()
			active = true
			launch = true

# Sortie de la zone : dialogue caché
func _on_NPC_body_exited(body):
	var dialogue_cataclysm = get_node_or_null("DialogueCataclysm")
	if dialogue_cataclysm:
		if body .name == 'Player1' or body .name == 'Player2':
			active = false
