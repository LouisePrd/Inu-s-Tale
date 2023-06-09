extends RichTextLabel

var launch = false

func _ready():
	pass

# Gestion du timer pour que le message reste quelques secs
func launchTimer():
	if self.visible == true:
		if not $TimerLabel.is_connected("timeout", self, "fade_message"):
			$TimerLabel.connect("timeout", self, "fade_message")
			$TimerLabel.start(2.5)

func fade_message():
	launch = true

# Gestion de l'opacité du message jusqu'à disparition
func _physics_process(delta):
	if self.visible == true and launch==true:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.2))
