extends Interactable

func _interact():
	visible = false
	remove_from_group("interactable")
	get_parent()._get_petted()
	return true  # do remove from interactable list

func _get_action():
	return "Press E to pet"

func _turn_on():
	visible = true
	add_to_group("interactable")
	