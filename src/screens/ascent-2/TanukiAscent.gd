extends Area2D

export (NodePath) var player1
export (NodePath) var player2
export (NodePath) var DialogueTanukiAscent

var active = false
var launch = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect( "body_exited", self, '_on_NPC_body_exited')
	player1 = get_node(player1)
	player2 = get_node(player2)
	DialogueTanukiAscent = get_node(DialogueTanukiAscent)

func _on_NPC_body_entered(body):
	print('enter')
	if launch==false:
		if body. name == 'Player1' or body. name == 'Player2':
			player1.move = false
			player2.move = false
			DialogueTanukiAscent.play()
			active = true
			launch = true

func _on_NPC_body_exited(body):
	if body .name == 'Player1' or body .name == 'Player2':
		active = false
