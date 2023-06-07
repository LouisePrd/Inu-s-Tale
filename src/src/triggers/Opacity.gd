extends Sprite

export (NodePath) var area
export (NodePath) var player1
export (NodePath) var player2
export (NodePath) var npc


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area = get_node(area)
	player1 = get_node(player1)
	player2 = get_node(player2)
	npc = get_node(npc)
	area.connect("body_entered", self, "_on_Area2D_body_entered")
	area.connect("body_exited", self, "_on_Area2D_body_exited")

func _on_Area2D_body_entered(body) -> void:
	if !body.is_in_group("Player"):
		return
	modulate.a = 0.5


func _on_Area2D_body_exited(body) -> void:
	var bodiesArray = area.get_overlapping_bodies()

	if bodiesArray.size() == 0:
		modulate.a = 1 
	elif bodiesArray.size() == 1 and bodiesArray.has(npc): 
		modulate.a = 1
	else: 
		modulate.a = 0.5
			
