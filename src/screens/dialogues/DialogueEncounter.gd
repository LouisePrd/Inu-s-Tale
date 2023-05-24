extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2

var dialogue_file = [
	{"name": "Tanuki", "text": "Bonjour et bienvenue à vous sur La Montagne du Koryu, j’imagine que vous cherchez la faille ?"},
	{"name": "Nao", "text": "Oui exactement, le festival va bientot se terminer et je raccompagne mon Inugami."},
	{"name": "Tanuki", "text": "Mes amis, j’ai une mauvaise nouvelle à vous annoncer. Vous n’avez pas pu rater le cataclysme qui a secoué la région et malheureusement il a eu des conséquences terribles pour tous les Yokai. La faille qui devait nous permettre de rentrer chez nous a été refermée."},
	{"name": "Inu", "text": "Quoi ?! Tu veux dire que je ne peux plus rentrer chez moi ?"},
	{"name": "Tanuki", "text": "Je crains que ce ne soit le cas, Inugami."},
	{"name": "Inu", "text": "Alors, qu'est-ce que cela signifie pour moi ? Suis-je condamné à rester ici et prendre possession de mon invocateur ? Nao..."},
	{"name": "Nao", "text": "Non ce n’est pas possible, il faut qu’on trouve une solution !"},
	{"name": "Tanuki", "text": "Il y en a bien une... Vous devez rejoindre le portail au sommet de la montagne mais ce n’est pas si simple. Suivez-moi, je vais vous expliquer."},
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
		player1.move = true
		player2.move = true
		return
	dialogues = load_dialogue()
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]['text']
	
	if dialogues[current_dialogue_id]['name'] == 'Nao':
		$"Inu-Sprite".visible = false
		$"Tanuki-Sprite".visible = false
		$"Nao-Sprite".visible = true
	elif dialogues[current_dialogue_id]['name'] == 'Inu':
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = false
		$"Inu-Sprite".visible = true
	else: 
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = true
		
	
