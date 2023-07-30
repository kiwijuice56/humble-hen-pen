extends AudioStreamPlayer

func _finished():
	queue_free()
