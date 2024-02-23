extends Node

var card = preload("res://Prefabs/Card.tscn")

var types = ["Spade", "Heart", "Diamond", "Club"]

func _ready():
	for i in range(4):
		for j in range(13):
			var newCard = card.instantiate()
			newCard.position = Vector2(i * 200 + 300, j * 50 + 50)
			newCard.new(j, types[i], false, randi()%8)
			add_child(newCard)

func dealCard() -> Node:
	var childCount = get_child_count()
	var randomCardIndex = randi() % childCount
	var randomCard = get_child(randomCardIndex)
	remove_child(randomCard)
	return randomCard
