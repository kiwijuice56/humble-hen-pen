extends Node2D

func _ready():
	$Screen/StartButton.grab_focus()

func _regrab():
	$Screen/OptionsButton.grab_focus()

func _start_game():
	get_tree().get_first_node_in_group("root")._change_scene(0)

func _options():
	get_tree().get_first_node_in_group("root")._open_options()
func _quit_game():
	get_tree().quit()
