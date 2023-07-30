extends Interactable

@export var chicken: PackedScene

func _process(_delta):
	if get_tree().get_first_node_in_group("game").money >= 35:
		if not is_in_group("interactable"):
			add_to_group("interactable")
	else:
		if is_in_group("interactable"):
			remove_from_group("interactable")

func _interact():
	get_tree().get_first_node_in_group("game")._change_money(-35)
	var newdog = chicken.instantiate()
	get_tree().get_first_node_in_group("game").add_child(newdog)
	newdog.position = get_tree().get_first_node_in_group("Player").global_position  + Vector2(700, 0)
	newdog.superize()
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/register.wav"), 0, randf() * 0.4 + 0.8)
	if get_tree().get_first_node_in_group("game").money <35 :
		return true # remove from interactable list
	else:
		return false # don't remove from interactable list

func _get_action():
	return "Press E to buy a super chicken"
