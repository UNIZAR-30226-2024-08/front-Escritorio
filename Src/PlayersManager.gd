extends Node2D

const AMOUNT_PLAYERS = 4
const player = preload("res://Prefabs/PokerPlayer.tscn")

func _ready():
	instantiatePlayers()

func instantiatePlayers():
	for n in get_children():
		remove_child(n)
		n.queue_free()
	for i in range(AMOUNT_PLAYERS):
		var newPlayer = player.instantiate()
		newPlayer.name = newPlayer.name + str(i)
		add_child(newPlayer)
