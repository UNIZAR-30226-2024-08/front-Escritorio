extends Node
# Controlador del juego de poker

const MAX_TURN = 3

var turn = 0

func reset():
	$Deck.reset()
	$PlayerManager.instantiatePlayers()

# TODO: Igual hay que replantearse esto...
# Función que comunica al Manager que jugada ha realizado el jugador
func _on_player_jugada(tipo, valor):
	if tipo == "Pasar":
		pass
	elif tipo == "Apostar":
		pass
	elif tipo == "Subir":
		pass
	elif tipo == "Igualar":
		pass
	elif tipo == "Retirarse":
		pass
	else:
		print("ERROR PRODUCIDO: JUGADA NO VALIDA")
