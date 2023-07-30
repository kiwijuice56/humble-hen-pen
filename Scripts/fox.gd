class_name Fox
extends CharacterBody2D

var speed = 200
var gravity = 500
var direction = Vector2.RIGHT
var running = false

@onready var sprite = $"fox"

func _ready():
	if position.x > 960:
		direction = Vector2.LEFT
		$"fox".flip_h = true
	$AnimationPlayer.play("Run")


func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()

func _on_scared_away(_body):
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/fox.wav"), 0, randf() * 0.4 + 0.8)
	if  running == false:
		running = true
		direction = -direction
		speed += 300
		$"fox".flip_h = !$"fox".flip_h
		var tween = get_tree().create_tween()
		tween.tween_interval(4)
		tween.tween_callback(queue_free)

