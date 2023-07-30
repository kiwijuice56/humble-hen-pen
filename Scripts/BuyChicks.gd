extends Interactable

@export var notif: PackedScene

func _process(_delta):
	if get_tree().get_first_node_in_group("game").money > -1:
		if not is_in_group("interactable"):
			add_to_group("interactable")
	else:
		if is_in_group("interactable"):
			remove_from_group("interactable")

func _interact():
	get_tree().get_first_node_in_group("game")._change_money(-10)
	get_tree().get_first_node_in_group("game")._change_chicks(1)
	var newNotif = notif.instantiate()
	get_tree().get_first_node_in_group("game").add_child(newNotif)
	newNotif.position = global_position
	newNotif._set_tween()

	if not get_tree().get_first_node_in_group("game").money > 9:
		return true # remove from interactable list
	else:
		return false # don't remove from interactable list

func _get_action():
	return "Press E to buy chick"
