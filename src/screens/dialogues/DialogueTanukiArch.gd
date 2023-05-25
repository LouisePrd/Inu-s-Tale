extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2
export (NodePath) var tanukibody
export (NodePath) var iconParchment
export (NodePath) var explainLabel

var dialogue_file = [
	{"name": "Nao", "text": "Dis-nous tout s’il te plait !"},
	{"name": "Tanuki", "text": "Un peu de patience, jeune homme. Pour atteindre le sommet de cette montagne, vous devez prouver votre valeur en passant une série d’énigmes."},
	{"name": "Tanuki", "text": "C'est votre chance de démontrer votre force et votre intelligence aux gardiens du royaume des Yokai."},
	{"name": "Inu", "text": "Des énigmes ? Qu'est-ce que cela implique exactement, Tanuki ?"},
	{"name": "Tanuki", "text": "Vous le comprendrez en temps voulu. "},	
	{"name": "Tanuki", "text": "Voici un parchemin précieux dans lequel vous trouvez toutes les informations dont vous avez besoin pour le moment."},
	{"name": "Tanuki", "text": "Gardez le précieusement et lisez le attentivement pour trouver votre chemin. Bon courage."},		
]

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false
	$"Nao-Sprite".visible = false
	$"Inu-Sprite".visible = false
	$"Tanuki-Sprite".visible = false

	player1 = get_node(player1)
	player2 = get_node(player2)
	tanukibody = get_node(tanukibody)
	iconParchment = get_node(iconParchment)
	explainLabel = get_node(explainLabel)
	iconParchment.visible = false
	explainLabel.visible = false
	
func play():
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
		$"Tanuki-Sprite".visible = false
		iconParchment.visible = true
		player1.move = true
		player2.move = true
		explainLabel.visible = true
		explainLabel.launchTimer()
		tanukibody.moveArch = true
		return
	dialogues = load_dialogue()
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]['text']
	
	if dialogues[current_dialogue_id]['name'] == 'Nao':
		$"Inu-Sprite".visible = false
		$"Tanuki-Sprite".visible = false
		$"Nao-Sprite".visible = true
	elif dialogues[current_dialogue_id]['name'] == 'Inu':
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = false
	else:
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = true
		
	
