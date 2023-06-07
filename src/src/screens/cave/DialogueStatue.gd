extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2

# Tableau des dialogues
var dialogue_file = [
	{"name": "Nao", "text": "Une statue de tanuki..."},
	{"name": "Nao", "text": "Qu’est-ce que fait une œuvre d’art pareille dans une grotte ?"},
	{"name": "Inu", "text": "Cette silhouette me rappelle quelque chose..."},
	{"name": "Inu", "text": "Une secte de Tanuki qui devient de plus en plus virulente, chez les Yokai..."},	
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
	elif dialogues[current_dialogue_id]['name'] == 'Inu':
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
	else:
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = false
		
	
