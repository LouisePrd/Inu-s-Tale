extends CanvasLayer

# On récupère le node des joueurs
export (NodePath) var player1
export (NodePath) var player2

# Tableau des dialogues
var dialogue_file = [
	{"name": "Nao", "text": "Une fresque..."},
	{"name": "Nao", "text": "Dis donc, on retrouve les mêmes symboles que tout à l’heure..."},
	{"name": "Inu", "text": "Ce sont des écritures Yokai anciennes..."},
	{"name": "Inu", "text": "« Le cataclysme signera la suprématie Yokai. Les humains devront se soumettre aux lois des esprits.» "},	
	{"name": "Nao", "text": "Le cataclysme ? Qu’est-ce que ça veut dire ?"},	
	{"name": "Nao", "text": "Tu penses que tout ça est un complot, Inu ?"},	
	{"name": "Inu", "text": "..."},	
	{"name": "Inu", "text": "Je ne sais pas..."},	
]

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false
	$"Nao-Sprite".visible = false
	$"Inu-Sprite".visible = false
	player1 = get_node(player1)
	player2 = get_node(player2)

# Lancement du dialogue
func play():
	dialogues = load_dialogue()
	$NinePatchRect.visible = true
	current_dialogue_id = -1
	next_line()

func load_dialogue():
	return dialogue_file

# Changement de dialogue quand barre espace
func _input(event):
	if event.is_action_pressed("skip"):
		next_line()

# Changement des lignes de dialogue
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
	# Récupération des lignes
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]['text']
	
	# Gestion de l'affichage des personnages concernés
	if dialogues[current_dialogue_id]['name'] == 'Nao':
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = true
	elif dialogues[current_dialogue_id]['name'] == 'Inu':
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
	else:
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = false
		
	
