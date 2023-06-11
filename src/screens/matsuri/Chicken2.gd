extends KinematicBody2D

var velocity = Vector2()
var _timer = null

var screen_size
export var speed = 80
var dir = Vector2.LEFT

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	var is_idling := is_zero_approx(velocity.y) 
	$Chicken.animation = "default"
	move(delta)
	$Chicken.play()
	
func move(delta):
	position += dir * speed * delta
