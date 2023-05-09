extends Area2D

var active = false
var launch = false


func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect( "body_exited", self, '_on_NPC_body_exited')

func _on_NPC_body_entered(body):
	var dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player and launch==false:
		print('oui')
		if body. name == 'Player1' or body. name == 'Player2':
			dialogue_player.play()
			active = true
			launch = true

func _on_NPC_body_exited(body):
	var dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		if body .name == 'Player1' or body .name == 'Player2':
			active = false

