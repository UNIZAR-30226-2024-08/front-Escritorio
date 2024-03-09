extends Node

const card = preload("res://Prefabs/Card.tscn")
const types = ["Spade", "Heart", "Diamond", "Club"]

func _ready():
	reset()

func deleteCards():
	for n in get_children():
		remove_child(n)
		n.queue_free()

func reset():
	deleteCards()
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
