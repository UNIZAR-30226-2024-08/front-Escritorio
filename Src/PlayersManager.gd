extends Node2D

const player = preload("res://Prefabs/PokerPlayer.tscn")

func instantiatePlayers(num_players):
	for n in get_children():
		remove_child(n)
		n.queue_free()
	for i in range(num_players):
		var newPlayer = player.instantiate()
		newPlayer.name = newPlayer.name + str(i)
		add_child(newPlayer)
