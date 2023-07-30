extends Node2D

@export var fox: PackedScene

var foxCD: float

var money = 0
var eggs = 0
var mayo = 0 # not implemented
var chicks = 0

func _change_money(_value):
	money += _value
	$Control._update_money(money)

func _change_eggs(_value):
	eggs += _value
	$Control._update_eggs(eggs)

func _change_mayo(_value):
	mayo += _value
	$Control._update_mayo(mayo)

func _change_chicks(_value):
	chicks += _value
	$Control._update_chicks(chicks)

func _ready():
	foxCD = randf() * 10 + 50

func _process(delta):
	foxCD -= delta * 1.5
	if foxCD <= 0:
		_fox()
		foxCD = randf() * 20 + 30

#spawns fox
func _fox():
	var lis123 = fox.instantiate()
	lis123.position = $foxSpawn.global_position
	get_parent().add_child(lis123)
