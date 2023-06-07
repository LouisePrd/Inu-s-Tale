extends CanvasLayer

export (NodePath) var player1
export (NodePath) var player2
export (NodePath) var tanukibody

var dialogue_file = [
	{"name": "Nao", "text": "Monsieur Tanuki...?"},
	{"name": "Tanuki", "text": "Vous êtes parvenus à résoudre l’énigme..."},
	{"name": "Tanuki", "text": "..."},
	{"name": "Tanuki", "text": "     ..."},
	{"name": "Tanuki", "text": "C’est bien malheureux."},
	{"name": "Nao", "text": "C’est super, vous voulez dire ! Inu va pouvoir rentrer chez lui !"},
	{"name": "Tanuki", "text": "Hah... Parce que vous pensez que je vais vous laisser traverser ce portail ?"},	
	{"name": "Tanuki", "text": "Vous êtes bien crédule..."},
	{"name": "Inu", "text": "Vous nous avez guidés jusqu’ici, Tanuki..."},	
	{"name": "Inu", "text": "Vous nous avez dit que le cataclysme avait refermé la faille..."},		
	{"name": "Tanuki", "text": "C’est exact ! Le cataclysme est notre plus belle œuvre !"},
	{"name": "Tanuki", "text": "Pourquoi les Yokai devraient-ils se cacher constamment dans leur royaume de nuit ?"},
	{"name": "Tanuki", "text": "Les Yokai doivent réclamer leur terre, celle qui leur a été volé par les humains : le monde des vivants !"},
	{"name": "Inu", "text": "Tu es complètement fou !"},
	{"name": "Inu", "text": "Je n’ai que faire du monde des vivants, laisse-moi traverser le portail ! Je ne veux pas faire de mal à mon ami !"},
	{"name": "Tanuki", "text": "Ha ha ha."},
	{"name": "Tanuki", "text": "Tu veux rentrer chez toi, Inugami ?"},
	{"name": "Tanuki", "text": "Vous devrez me vaincre d’abord."},	
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
		$"Inu-Sprite".visible = true
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = false
	else:
		$"Inu-Sprite".visible = false
		$"Nao-Sprite".visible = false
		$"Tanuki-Sprite".visible = true
		
	
