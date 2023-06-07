extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2

var dialogue_file = [
	{"name": "Nao", "text": "Wow, Inu, regardez autour de nous ! Nous sommes enfin arrivés à Osaka, la ville qui regorge de mystères et de beauté."},
	{"name": "Inu", "text": "Oui, Nao, c'est une ville pleine d'histoire et de tradition. Et maintenant, nous sommes ici pour profiter du festival matsuri."},
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
	else:
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
		
	
