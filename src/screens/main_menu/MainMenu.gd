extends Node2D

export var mainGameScene : PackedScene 
export var optionsScene: PackedScene


func _on_New_game_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)


func _on_Options_Button_button_up():
	var options = load(optionsScene.resource_path).instance()
	get_tree().current_scene.add_child(options)


func _on_Quit_button_button_up():
	get_tree().quit()
