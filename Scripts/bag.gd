extends TextureRect

var open = false

@export var textureClosed: Texture
@export var textureOpen: Texture

func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		if open:
			_close()
		else:
			_open()

func _open():
	open = true
	texture = textureOpen
	$Inventory.visible = true

func _close():
	open = false
	texture = textureClosed
	$Inventory.visible = false
