extends Node2D

@export var cloud: PackedScene

var cooldown = 0

@export var spawnX: float

func _physics_process(delta):
	if cooldown > 0:
		cooldown -= delta
	else:
		cooldown = (randf() * 3) + 3
		var newCloud = cloud.instantiate()
		newCloud.position = Vector2(spawnX, position.y + randf_range(100, 500))
		add_child(newCloud)
