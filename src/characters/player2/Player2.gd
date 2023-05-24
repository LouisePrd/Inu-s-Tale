extends KinematicBody2D

export (NodePath) var player1

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
export var move = true
var randomSentences = [
	'Dépêche-toi, on doit agir vite !',
	'Plus vite, Nao !',
	'Accélère Nao, le portail nous attend',
	'Ne tarde pas, il y a urgence !',
	'Vite, chaque seconde compte !'
]
var rng = RandomNumberGenerator.new()
var random

func _ready():
	screen_size = get_viewport_rect().size
	player1 = get_node(player1)
	$TriggerPositionP1.visible = false
	random = rng.randf_range(0, 4)
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	var is_idling := is_zero_approx(velocity.x) 
	
	if Input.is_action_pressed("player2_move_right"):
		if move == false:
			return
			
		if  self.global_position[0] - player1.global_position[0] >= 300:
			velocity.x = 0
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.play()
			$TriggerPositionP1.visible = true
			$TriggerPositionP1.get_children()[0].text = randomSentences[random]
			return
		velocity.x += 1
		
	if Input.is_action_pressed("player2_move_left"):
		if move == false:
			return
			
		if  self.global_position[0] - player1.global_position[0] <= -300 or move == false:
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
		$TriggerPositionP1.visible = false
		random = rng.randf_range(0, 4)
	elif is_idling:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "idle"

func stop():
	$AnimatedSprite.animation = "idle"
	move = false
