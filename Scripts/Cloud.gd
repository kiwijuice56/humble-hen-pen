extends Sprite2D

@export var cloudTex: Array[CompressedTexture2D]
var speed

func _ready():
	var newScale = randf_range(1, 1.6)
	scale = Vector2(newScale, newScale)
	texture = cloudTex[randi() % cloudTex.size()]
	speed = randf_range(0.8, 1.2)

func _physics_process(delta):
	# Move the sprite along the local x-axis.
	translate(Vector2(40 * delta * speed, 0))
	if position.x > 2300:
		queue_free()
