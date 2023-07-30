extends Node2D

signal paused

var game_paused = false

func _process(_delta):
	pass

func _on_resume_pressed():
	game_paused = false
	get_tree().paused = false
	$Pause.visible = false

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().get_first_node_in_group("root")._change_scene(1)

func _on_options_pressed():
	get_tree().get_first_node_in_group("root")._open_options()

func _regrab():
	$Pause/Control/ColorRect/Options.grab_focus()
