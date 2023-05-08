extends KinematicBody2D

export (NodePath) var player2

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var can_move = true

func _ready():
	screen_size = get_viewport_rect().size
	player2 = get_node(player2)
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	var is_idling := is_zero_approx(velocity.x) 
		
	if Input.is_action_pressed("player1_move_right"):
		can_move = true
		if  self.global_position[0] - player2.global_position[0] >= 300:
			velocity.x = 0
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.play()
			return
		velocity.x += 1
	if Input.is_action_pressed("player1_move_left"):
		if  self.global_position[0] - player2.global_position[0] <= -300 or can_move == false:
			velocity.x = 0
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.play()
			return
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

func stop():
	$AnimatedSprite.animation = "idle"
	can_move = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.stop()


