extends Interactable

@export var notif: PackedScene

func _interact():
	get_tree().get_first_node_in_group("game")._change_eggs(1)
	var newNotif = notif.instantiate()
	get_tree().get_first_node_in_group("game").add_child(newNotif)
	newNotif.get_parent().move_child(newNotif, -1)
	newNotif.position = global_position
	newNotif._set_tween()
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/bop.wav"), 0, randf() * 0.4 + 0.8)
	get_parent().queue_free()
	return true  # do remove from interactable list

func _get_action():
	return "Press E to pick up egg"

