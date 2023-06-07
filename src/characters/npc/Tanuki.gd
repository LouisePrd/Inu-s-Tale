extends KinematicBody2D

export (NodePath) var player1
export (NodePath) var player2

export var move = false

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
		move = false
		player1.speed = 100
		player2.speed = 100

	if move == true: 
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "walk"
		player1.speed = 80
		player2.speed = 80
		moving(delta)
	elif is_idling:
		$AnimatedSprite.animation = "idle"

	$AnimatedSprite.play()


func moving(delta):
	position += dir * speed * delta


#
#extends KinematicBody2D
#
#export (NodePath) var player1
#export (NodePath) var player2
#
#export var move = false
#
#var screen_size
#export var speed = 0 
#var dir = Vector2.RIGHT
#var velocity = Vector2.ZERO
#
#func _ready():
#	screen_size = get_viewport_rect().size
#	player1 = get_node(player1)
#	player2 = get_node(player2)
#
#func _process(delta):
#
#	var is_idling := is_zero_approx(velocity.x)
#
#	velocity.x = 0
#
#	if self.global_position[0] > 1920:
#		move = false
#		player1.speed = 100
#		player2.speed = 100
#
#	if move == true: 
#		$AnimatedSprite.flip_h = false
#		$AnimatedSprite.animation = "walk"
#		player1.speed = 80
#		player2.speed = 80
#		self.speed = 80
#		move(delta)
#	elif is_idling:
#		$AnimatedSprite.animation = "idle"
#
#	$AnimatedSprite.play()
#
#
#
#func move(delta):
#	velocity.x += speed
#	velocity = move_and_slide(velocity, Vector2(0, -1))
##	position += dir * speed * delta
