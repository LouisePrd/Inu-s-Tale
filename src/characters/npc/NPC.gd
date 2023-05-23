extends KinematicBody2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var is_idling := is_zero_approx(velocity.x) 

	$AnimatedSprite.play()
	
	if is_idling:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "idle"
