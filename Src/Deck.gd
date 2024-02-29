extends Node

var card = preload("res://Prefabs/Card.tscn")

var types = ["Spade", "Heart", "Diamond", "Club"]

func _ready():
	self.position = Vector2(40, 40)
	for i in range(4):
		for j in range(13):
			var newCard = card.instantiate()
			newCard.new(j, types[i], false, 0)
			add_child(newCard)

func deal_card() -> Node:
	var childCount = get_child_count()
	if childCount > 0 :
		var randomCardIndex = randi() % childCount
		var randomCard = get_child(randomCardIndex)
		remove_child(randomCard)
		return randomCard
	return null
