extends Node

@export var game: PackedScene
@export var menu: PackedScene

var optionsOpen = false

enum Scene { GAME, MENU }

var current_scene = Scene.GAME
var sceneNode: Node

func _ready():
	randomize()
	await ready
	_change_scene(Scene.MENU)

func _change_scene(newScene: Scene):
	if newScene != Scene.MENU:
		$AnimationPlayer.play("trans_in")
		await $AnimationPlayer.animation_finished
	if sceneNode != null:
		sceneNode.queue_free()
	
	if newScene == Scene.GAME:
		sceneNode = game.instantiate()
	elif newScene == Scene.MENU:
		sceneNode = menu.instantiate()
	add_child(sceneNode)
	current_scene = newScene

	$AnimationPlayer.play("trans_out")
	await $AnimationPlayer.animation_finished

func _close_options():
	$Options.visible = false
	optionsOpen = false
	get_tree().get_first_node_in_group("regrab")._regrab()
	get_tree().paused = false

func _open_options():
	$Options.visible = true
	optionsOpen = true
	$Options/Options/Return.grab_focus()
	get_tree().paused = true
