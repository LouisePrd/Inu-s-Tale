extends KinematicBody2D

export (NodePath) var player1
export (NodePath) var player2

var velocity = Vector2()
export var moveArch = false
var _timer = null

var screen_size
export var speed = 80
var dir = Vector2.RIGHT

func _ready():
	screen_size = get_viewport_rect().size
	player1 = get_node(player1)
	player2 = get_node(player2)

func _process(delta):
	var velocity = Vector2.ZERO
	var is_idling := is_zero_approx(velocity.x) 
	
	if self.global_position[0] > 1920:
		moveArch = false
		player1.speed = 100
		player2.speed = 100
	
	if moveArch == true:
		$Tanuki.flip_h = false
		$Tanuki.animation = "walk"
		player1.speed = 80
		player2.speed = 80
		move(delta)
	elif is_idling:
		$Tanuki.animation = "idle"
		
	$Tanuki.play()
	

	
func move(delta):
	position += dir * speed * delta
