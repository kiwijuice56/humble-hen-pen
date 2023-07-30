extends Camera2D

class_name Camera

var target_position

func _ready():
	target_position = global_position

func _update_pos(pos):
	target_position.x = pos
	if target_position.x > 1400: # world bounds
		target_position.x = 1400
	elif target_position.x < 600:
		target_position.x = 600

func _physics_process(_delta):
	global_position = lerp(global_position, target_position, 0.08)
