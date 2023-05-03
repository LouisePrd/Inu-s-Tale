extends KinematicBody2D

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	var is_idling := is_zero_approx(velocity.x) 
	
	if Input.is_action_pressed("player1_move_right"):
		velocity.x += 1
	if Input.is_action_pressed("player1_move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	$AnimatedSprite.play()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif is_idling:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "idle"




