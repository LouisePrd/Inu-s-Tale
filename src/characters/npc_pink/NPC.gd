extends KinematicBody2D

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(_delta: float) ->  void:
	var velocity = Vector2.ZERO # The player's movement vector.
	var _is_idling := is_zero_approx(velocity.x) 
	$AnimatedSprite.play()
	$AnimatedSprite.animation = "idle"
