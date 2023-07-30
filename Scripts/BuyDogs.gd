extends Interactable


func _process(_delta):
	if get_tree().get_first_node_in_group("game").money >= 60 and not %Dog.bought:
		if not is_in_group("interactable"):
			add_to_group("interactable")
	else:
		if is_in_group("interactable"):
			remove_from_group("interactable")

func _interact():
	get_tree().get_first_node_in_group("game")._change_money(-60)
	%Dog.buy()
	$sprite.texture = load("res://Assets/Art/Entities/itsboughtyay.png")
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/register.wav"), 0, randf() * 0.4 + 0.8)
	return true

func _get_action():
	return "Press E to buy a dog"
