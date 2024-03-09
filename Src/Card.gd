extends Node
class_name Card

# TODO: No es necesario exportar los valores al editor sobre lo que es una carta
# porque se le asigna automáticamente en la creación de Deck

@export var value : int				# The number of the card
@export var type : String			# The type of the card (Clubs, Diamonds, Hearts or Spades)
@export var facing_up : bool		# If the card is facing up
@export var back : int				# Number of the sprite of the back
@export var front_sprite : Resource	# Sprite to be rendered when facing up
@export var back_sprite : Resource	# Sprite to be rendered when facing down

@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $Area2D/CollisionShape2D

func new(newValue : int, newType : String) -> void:
	value = newValue
	type = newType
	facing_up = false
	
	# TODO: De esto no es necesario preocuparse ahora
	front_sprite = load("res://Assets/" + type + "s/" + type + "s_card_" + __value_to_string(value) + ".png")
	back_sprite = load("res://Assets/Backs/back_" + str(back) + ".png")

func set_facing_up(newFacingUp : bool = facing_up):
	facing_up = newFacingUp
	if (newFacingUp):
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


func _on_area_2d_mouse_entered():
	if facing_up:
		sprite.scale = Vector2(1.5, 1.5)
		collision.scale = Vector2(1.5, 1.5)
		sprite.z_index = 1
		collision.z_index = 1

func _on_area_2d_mouse_exited():
	sprite.scale = Vector2(1.0, 1.0)
	collision.scale = Vector2(1.0, 1.0)
	sprite.z_index = 0
	collision.z_index = 0
