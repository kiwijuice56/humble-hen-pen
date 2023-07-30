extends CharacterBody2D

var speed = 300
var direction = Vector2.ZERO
var love = 100
var walkTimer

func _ready():
	walkTimer = randf_range(0, 2)

func _physics_process(_delta):

	if is_on_floor():
		_movement(_delta)
	else:
		velocity.y += 100 * _delta
		move_and_slide()

	love -= _delta
	if love <= 60:
		$PetZone._turn_on()


func _movement(_delta):

	if walkTimer > 0:
		walkTimer -= _delta
	else:
		_randomise_move()

	velocity = direction * speed

	move_and_slide()

func _die(_area = null):
	queue_free()

func _randomise_move():

	if direction == Vector2.LEFT || direction == Vector2.RIGHT:
		direction = Vector2.ZERO
		walkTimer = randf_range(1, 2)
	else:
		if global_position.x > 1600:
			_walk_left()
		elif global_position.x < 100:
			_walk_right()
		else:
			var rand = randi_range(0, 1)
			if rand == 0:
				_walk_left()
			else:
				_walk_right()

func _walk_left():
	direction = Vector2.LEFT
	$dog.flip_h = true
	walkTimer = randf_range(1.5, 2.5)

func _walk_right():
	direction = Vector2.RIGHT
	$dog.flip_h = false
	walkTimer = randf_range(1.5, 2.5)

func _get_petted():
	love = 100
	$Heart.position = Vector2(0, -64)
	$Heart.modulate = Color(1,1,1,1)
	var tween = get_tree().create_tween()
	tween.tween_property($Heart, "modulate", Color(1,1,1,0), 1)
	tween.parallel()
	tween.tween_property($Heart, "position", Vector2(0, -128), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
