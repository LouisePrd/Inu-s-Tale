extends CanvasLayer

var dialogue_file = [
	{"name": "Nao", "text": "Wow, Inu, regardez autour de nous ! Nous sommes enfin arrivés à Osaka, la ville qui regorge de mystères et de beauté."},
	{"name": "Inu", "text": "Oui, Nao, c'est une ville pleine d'histoire et de tradition. Et maintenant, nous sommes ici pour profiter du festival matsuri."},
]

var dialogues = []
var current_dialogue_id = 0

func _ready():
	play()
	
func play():
	dialogues = load_dialogue()
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
		return
	dialogues = load_dialogue()
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]['text']
	
