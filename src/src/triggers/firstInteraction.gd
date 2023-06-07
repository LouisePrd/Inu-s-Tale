extends Area2D

var active = false
var launch = false
var dialogue_player = get_node_or_null("DialoguePlayer")

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect( "body_exited", self, '_on_NPC_body_exited')
	if dialogue_player:
		print('existe')
	else:
		print('non lol')

func _on_NPC_body_entered(body):
	if dialogue_player and launch==false:
		if body. name == 'Player1' or body. name == 'Player2':
			dialogue_player.play()
			active = true
			launch = true

func _on_NPC_body_exited(body):
	if dialogue_player:
		if body .name == 'Player1' or body .name == 'Player2':
			active = false

