extends CanvasLayer

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_return()

func _return():
	get_parent()._close_options()

func _change_master_volume(_value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(_value))

func _change_music_volume(_value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(_value))

func _change_sfx_volume(_value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(_value))

func _change_ui_volume(_value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("UI"), linear_to_db(_value))
