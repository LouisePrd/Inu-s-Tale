extends VideoPlayer

export var mainMenu: PackedScene

func _ready():
	pass

func _on_VideoPlayer_finished():
	get_tree().change_scene(mainMenu.resource_path)
