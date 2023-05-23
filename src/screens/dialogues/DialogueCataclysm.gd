extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2

var dialogue_file = [
	{"name": "Nao", "text": "Par les dieux, regarde ça ! La ville est en ruines et les arbres sont déracinés... Qu'est-ce qui s'est passé ici ?"},
	{"name": "Inu", "text": "Il y a une énergie étrange dans l'air, cela ressemble à un cataclysme puissant. On devrait se dépecher de trouver la faille, ça n’annonce rien de bon..."},
	{"name": "Nao", "text": "Tu as raison, allons-y."},
]

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false
	$"Nao-Sprite".visible = false
	$"Inu-Sprite".visible = false
	player1 = get_node(player1)
	player2 = get_node(player2)
	
func play():
	print('play')
	dialogues = load_dialogue()
	$NinePatchRect.visible = true
	current_dialogue_id = -1
	next_line()

func load_dialogue():
	return dialogue_file

func _input(event):
	if event.is_action_pressed("skip"):
		next_line()
		
func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		$NinePatchRect.visible = false
		$"Nao-Sprite".visible = false
		$"Inu-Sprite".visible = false
		player1.move = true
		player2.move = true
		return
	dialogues = load_dialogue()
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]['text']
	
	if dialogues[current_dialogue_id]['name'] == 'Nao':
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = true
	else:
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
		
	
