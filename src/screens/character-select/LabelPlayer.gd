extends Label

var naoPlayer = 1 setget set_naoPlayer
var inuPlayer = 2 setget set_inuPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_naoPlayer(value) -> void:
	naoPlayer=value
	self.text=str(value)
	

func set_inuPlayer(value) -> void:
	inuPlayer=value
	$Label.text=str(value)
