extends Interactable

@export var chick: PackedScene

func _process(_delta):
	if get_tree().get_first_node_in_group("game").chicks > 0:
		if not is_in_group("interactable"):
			add_to_group("interactable")
	else:
		if is_in_group("interactable"):
			remove_from_group("interactable")

func _interact():
	get_tree().get_first_node_in_group("game")._change_chicks(-1)
	var newchick = chick.instantiate()
	get_tree().get_first_node_in_group("game").add_child(newchick)
	newchick.position = get_tree().get_first_node_in_group("Player").global_position

	if not get_tree().get_first_node_in_group("game").chicks > 0:
		return true # remove from interactable list
	else:
		return false # don't remove from interactable list

func _get_action():
	return "Press E to release chick"
