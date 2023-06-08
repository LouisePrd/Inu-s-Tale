extends Node2D

onready var nao_btn = $VBoxContainer1/MarginContainer/ButtonNao
onready var inu_btn = $VBoxContainer2/MarginContainer/ButtonInu
onready var nao_player_label = $VBoxContainer1/MarginContainer4/LabelPlayerNao
onready var inu_player_label = $VBoxContainer2/MarginContainer4/LabelPlayerInu

export var player1_character = "Nao"
export var player2_character = "Inu"

export var scene : PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	nao_btn.grab_focus();
	nao_player_label.text="1";
	inu_player_label.text="2";
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonNao_button_up():
	pass


func _on_ButtonInu_button_up():
	pass

func _on_ButtonNao_focus_entered():
	nao_player_label.text="1";
	player1_character = "Nao"


func _on_ButtonNao_focus_exited():
	nao_player_label.text="2";
	player2_character = "Nao"


func _on_ButtonInu_focus_entered():
	inu_player_label.text="1";
	player1_character = "Inu"


func _on_ButtonInu_focus_exited():
	inu_player_label.text="2";
	player2_character = "Inu"


func _on_ButtonNao_pressed():
	player1_character = "Nao"
	player2_character = "Inu"
	Transition.transition_to(scene.resource_path)
	var autoload = $"/root/AutoloadMusic".get_children()
	autoload[0].stop()

func _on_ButtonInu_pressed():
	player1_character = "Inu"
	player2_character = "Nao"
	Transition.transition_to(scene.resource_path)
	var autoload = $"/root/AutoloadMusic".get_children()
	autoload[0].stop()
