extends Label

func _set_tween():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), 1.5)
	tween.parallel()
	tween.tween_property(self, "position", global_position + Vector2(0, -128), 1.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(queue_free)

