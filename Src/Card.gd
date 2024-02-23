extends Node

@export var value : int
@export var type : String
@export var facing_up : bool
@export var back : int

@onready var sprite = $Sprite2D

func new(newValue : int, newType : String, newFacingUp : bool, newBack : int) -> void:
	value = newValue
	type = newType
	facing_up = newFacingUp
	back = newBack

func _ready():
	setFacing(facing_up)

func setVisibility(newVisible : bool) -> void:
	sprite.visible = newVisible

func setFacing(newFacingUp : bool):
	facing_up = newFacingUp
	if (newFacingUp):
		sprite.texture = load("res://Assets/" + type + "s/" + type + "s_card_" + int_to_string_number(value) + ".png")
	else:
		sprite.texture = load("res://Assets/Backs/back_" + str(back) + ".png")

func int_to_string_number(val : int) -> String:
	var number = str(val+1)
	if number.length() == 1:
		number = "0" + number
	return number
