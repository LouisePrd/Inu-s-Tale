extends KinematicBody2D

export (NodePath) var player1

export var speed = 100 # How fast the player will move (pixels/sec).
export var gravity = 1200
var velocity = Vector2.ZERO
export var move = true

var screen_size # Size of the game window.

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
	var is_idling := is_zero_approx(velocity.x)
	
	velocity.x = 0
	var right = Input.is_action_pressed('player2_move_right')
	var left = Input.is_action_pressed('player2_move_left')
		
	if right:
		if move == false:
			return

		# Condition pour empêcher les joueurs de trop s'éloigner l'un de l'autre vers la droite
		if  self.global_position[0] - player1.global_position[0] >= 300:
			velocity.x = 0
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.play()
			$TriggerPositionP1.visible = true
			$TriggerPositionP1.get_children()[0].text = randomSentences[random]
			return
	
		velocity.x += speed
		
	if left:
		if move == false:
			return

		# Condition pour empêcher les joueurs de trop s'éloigner l'un de l'autre vers la gauche
		if  self.global_position[0] - player1.global_position[0] <= -300 or move == false:
			velocity.x = 0
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.play()
			return

		velocity.x -= speed
	
	# Gestion de l'affichage joueur inactif
	if move == false:
		velocity.x = 0
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.play()
	
	# Gestion de l'affichage joueur actif
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
	
	$AnimatedSprite.play()
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))

# Gestion de l'affichage quand le joueur entre dans la zone de l'élément
func stop():
	$AnimatedSprite.animation = "idle"
	move = false
	
# Gestion joueur entre dans la zone de l'élément
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.stop()

