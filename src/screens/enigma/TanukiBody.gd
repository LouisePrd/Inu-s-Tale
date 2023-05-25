extends KinematicBody2D

var velocity = Vector2()
var _timer = null

func _ready():
	pass

func tanuki_leave():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.01)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func _on_Timer_timeout():
	if $Tanuki.position.x<2000:
		$Tanuki.position.x += 1
