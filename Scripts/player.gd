extends RigidBody2D

@export var camera: Camera

var interactables: Array

# farmer moves left/right
func _physics_process(_delta):
	_movement()
	_camera()
	_interactions()

func _movement():
	if Input.is_action_pressed("ui_left"):
		$Sprite2D/GPUParticles2D.emitting = true
		$AnimationPlayer.play("walk_left")
		linear_velocity.x = -300
		if Input.is_action_pressed("sprint"):
			$AnimationPlayer.speed_scale = 4
			linear_velocity.x = -600
		else:
			$AnimationPlayer.speed_scale = 2
	if Input.is_action_pressed("ui_right"):
		$Sprite2D/GPUParticles2D2.emitting = true
		$AnimationPlayer.play("walk_right")
		linear_velocity.x = 300
		if Input.is_action_pressed("sprint"):
			$AnimationPlayer.speed_scale = 4
			linear_velocity.x = 600
		else:
			$AnimationPlayer.speed_scale = 2
	if linear_velocity.x <= 250 and linear_velocity.x >= -250:
		$AnimationPlayer.play("idle")
		$Sprite2D/GPUParticles2D.emitting = false
		$Sprite2D/GPUParticles2D2.emitting = false

func _interactions():
	if interactables.size() > 0:
		$actions.text = interactables[0]._get_action()

		if Input.is_action_just_pressed("interact"):
			if interactables[0]._interact():
				interactables.erase(interactables[0])
	else:
		$actions.text = ""
	

func _camera():
	camera._update_pos(position.x)

func _on_area_entered(area):
	if area.is_in_group("interactable"):
		interactables.append(area)

func _on_area_exited(area):
	if area.is_in_group("interactable"):
		interactables.erase(area)

func step() -> void:
	get_tree().get_first_node_in_group("SFX")._play_sound(load("res://Assets/Audio/SFX/Game/grass.wav"), SfxManager.SFXType.GAME, 1.0 + randf() * 0.2 - 0.1)
