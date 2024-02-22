extends Node

var deck

func _ready():
	deck = get_node("../Deck")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		add_child(deck.dealCard())
