extends Node
class_name Card

@export var value : int
@export var type : String
@export var facing_up : bool
@export var back : int
@export var front_sprite : Resource
@export var back_sprite : Resource

@onready var sprite : Sprite2D = $Sprite2D

func new(newValue : int, newType : String, newFacingUp : bool, newBack : int) -> void:
	value = newValue
	type = newType
	facing_up = newFacingUp
	back = newBack
	front_sprite = load("res://Assets/" + type + "s/" + type + "s_card_" + __value_to_string(value) + ".png")
	back_sprite = load("res://Assets/Backs/back_" + str(back) + ".png")

func _ready():
	set_facing_up(facing_up)

func set_facing_up(newFacingUp : bool = facing_up):
	facing_up = newFacingUp
	if (facing_up):
		sprite.texture = front_sprite
	else:
		sprite.texture = back_sprite

func change_back(newBack : int):
	back = newBack
	back_sprite = load("res://Assets/Backs/back_" + str(newBack) + ".png")

func __value_to_string(val : int) -> String:
	var number = str(val+1)
	if number.length() == 1:
		number = "0" + number
	return number
