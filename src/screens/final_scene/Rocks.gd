extends ParallaxLayer

export(float) var CLOUD_SPEED = 2.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	self.motion_offset.x += CLOUD_SPEED * delta
	
