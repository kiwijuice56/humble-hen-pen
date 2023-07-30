extends Control

@export var dog: PackedScene
@export var tutAnim: AnimationPlayer

func _update_money(newAmount: int):
	$CL/Money.text = str(newAmount)

func _update_eggs(newAmount: int):
	$CL/Bag/Inventory/Eggs.text = str(newAmount)

func _update_mayo(newAmount: int):
	$CL/Bag/Inventory/Mayo.text = str(newAmount)

func _update_chicks(newAmount: int):
	$CL/Bag/Inventory/Chicks.text = str(newAmount)

var bomba = false
var bierz = false

func _ready():
	tutAnim.play("Tutorial")
	%Button.pressed.connect(get_parent().get_parent().get_parent()._open_options)

func _on_button_pressed():
	# Toggle shop display
	if bierz == false:
			bomba = true
			bierz = true
	else :
		if bierz == true:
				bierz = false
				bomba = false
	if bomba == true:
		$ColorRect.show()
	else :
		$ColorRect.hide()


func _dog():
	var dog123 = dog.instantiate()
	dog123.position = $ColorRect/dog.position
	get_parent().add_child(dog123)

