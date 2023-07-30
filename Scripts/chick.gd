extends CharacterBody2D

@export var egg: PackedScene
var speed = 150
var direction = Vector2.ZERO
var love = 100
var walkTimer
var eggTimer
var adult = false
var amazing: bool = false

func _ready():
	walkTimer = randf_range(0, 2)
	eggTimer = randf_range(10, 15)
	$kura.start(randf_range(25, 38))
	$Timer2.start(randf_range(6,16))
	$Timer2.timeout.connect(chirp)

func chirp() -> void:
	if adult:
		get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/bocbocboc.wav"), -18, 1.0 + randf() * 0.2 - 0.1)
	else:
		get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/peepsmall.wav"), -12, 1.0 + randf() * 0.2 - 0.1)
	$Timer2.start(randf_range(6,16))

func _physics_process(_delta):
	if is_on_floor():
		_movement(_delta)
	else:
		velocity.y += 100 * _delta
		move_and_slide()

	love -= _delta * 4
	if love <= 45:
		$PetZone._turn_on()

	if adult == true:
		eggTimer -= _delta * (3 if amazing else 0.6)
		if eggTimer <= 0 and love >= 60:
			_egg()
			eggTimer = randf_range(15, 25)
	

func _movement(_delta):

	if walkTimer > 0:
		walkTimer -= _delta
	else:
		_randomise_move()

	velocity = direction * speed

	move_and_slide()
	
	position.x = max(800, position.x)

func _die(_area = null):
	queue_free()

func _randomise_move():
	randomize()
	if direction == Vector2.LEFT || direction == Vector2.RIGHT:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D2.stop()
		$AnimatedSprite2D3.stop()
		direction = Vector2.ZERO
		walkTimer = randf_range(2, 7)
	else:
		if global_position.x > 1400:
			_walk_left()
		elif global_position.x < 300:
			_walk_right()
		else:
			var rand = randi_range(0, 1)
			if rand == 0:
				_walk_left()
			else:
				_walk_right()

func _walk_left():
	$AnimatedSprite2D.play("walk")
	$AnimatedSprite2D2.play("walk")
	$AnimatedSprite2D3.play("walk")
	direction = Vector2.LEFT
	$AnimatedSprite2D.flip_h = false
	$AnimatedSprite2D2.flip_h = false
	$AnimatedSprite2D3.flip_h = false
	walkTimer = randf_range(1, 2)

func _walk_right():
	$AnimatedSprite2D.play("walk")
	$AnimatedSprite2D2.play("walk")
	$AnimatedSprite2D3.play("walk")
	direction = Vector2.RIGHT
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D2.flip_h = true
	$AnimatedSprite2D3.flip_h = true
	walkTimer = randf_range(1, 2)

# lay eggs
func _on_timer_timeout():
	print("does this ever happen??")
	if love >= 50: #if hen is happy enough, spawn egg
		_egg()

# spawn egg instance
func _egg():
	var newEgg = egg.instantiate()
	newEgg.position = global_position
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/bop.wav"), 0, randf() * 0.4 + 0.8)
	get_parent().add_child(newEgg)


# grow up
func _grow_up():
	if amazing:
		return
	
	$AnimatedSprite2D2.show()
	$AnimatedSprite2D.hide()
	$Timer.start()
	$kura.queue_free()
	adult = true

func superize() -> void:
	$AnimatedSprite2D3.show()
	$AnimatedSprite2D.hide()
	$Timer.start()
	$kura.queue_free()
	adult = true
	amazing = true

func _get_petted():
	love = 100 + randf_range(10, 50)
	$Heart.position = Vector2(0, -64)
	$Heart.modulate = Color(1,1,1,1)
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/yay.wav"), 0, randf() * 0.4 + 0.8)
	var tween = get_tree().create_tween()
	tween.tween_property($Heart, "modulate", Color(1,1,1,0), 1)
	tween.parallel()
	tween.tween_property($Heart, "position", Vector2(0, -128), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
