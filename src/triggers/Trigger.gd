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

func _on_NPC_body_entered(body):
	var dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player and launch==false:
		if body. name == 'Player1' or body. name == 'Player2':
			player1.move = false
			player2.move = false
			dialogue_player.play()
			active = true
			launch = true

func _on_NPC_body_exited(body):
	var dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		if body .name == 'Player1' or body .name == 'Player2':
			active = false
