extends RigidBody2D

func _ready():
	linear_velocity = Vector2(0, -200)
	$Timer.start(randf_range(8, 20))
	await $Timer.timeout
	queue_free()
	var chicken = load("res://Nodes/chicken.tscn").instantiate()
	get_parent().add_child(chicken)
	chicken.global_position = global_position
