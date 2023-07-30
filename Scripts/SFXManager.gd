class_name SfxManager
extends Node

enum SFXType { GAME, UI }

@export var sfxPlayer: PackedScene

func _play_sound(sound: AudioStream, type: SFXType, pitch: float = 1.0, volume: float = 1.0):
	var sfx = sfxPlayer.instantiate()

	sfx.stream = sound
	sfx.pitch_scale = pitch
	sfx.volume_db = volume

	if type == SFXType.GAME:
		sfx.bus = "SFX"
	elif type == SFXType.UI:
		sfx.bus = "UI"
	else:
		sfx.bus = "SFX"

	add_child(sfx)
	sfx.play()
