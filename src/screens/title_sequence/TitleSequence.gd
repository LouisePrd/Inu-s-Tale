extends VideoPlayer

export var mainMenu: PackedScene

func _ready():
	var autoload = $"/root/AutoloadMusic".get_children()
	autoload[0].stop()

func _on_VideoPlayer_finished():
	get_tree().change_scene(mainMenu.resource_path)
