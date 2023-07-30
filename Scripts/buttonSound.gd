extends Button

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/UI/button.wav"), 1, randf() * 0.4 + 0.8)
