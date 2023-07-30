extends Node2D

var bought: bool = false

func _ready() -> void:
	$Area2D.area_entered.connect(_fox_entered)
	$Area2D.area_exited.connect(_fox_exited)
	visible = false
	bought = false

func buy() -> void:
	visible = true
	bought = true

func _fox_entered(fox: Area2D):
	if not bought:
		return
	if fox.get_parent() is Fox:
		get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/bark.wav"), 0, randf() * 0.4 + 0.8)
		$warning.visible = true

func _fox_exited(fox: Area2D):
	if not bought:
		return
	if fox.get_parent() is Fox:
		$warning.visible = false
