extends Node
# Controlador del juego de poker

const TURNO_INICIAL = 1
const TURNO_FINAL = 4
const AMOUNT_PLAYERS = 4

var turno = 0
var maxApuesta = 0
var lastMaxApuesta = 0
var jugadas = [false, false, false, false]
var apuestas = [0, 0, 0, 0]

func _ready():
	newGame()

func newGame():
	$Deck.reset()
	initialTurn()
	
	$PlayerManager.instantiatePlayers(AMOUNT_PLAYERS)
	
	$UI.enableButtons(["Pasar", "Igualar", "Subir"], false)
	$UI.enableButtons(["Apostar", "Retirarse"], true)
	
	turno = 0
	maxApuesta = 0
	jugadas = [false, false, false, false]
	var apuestas = [0, 0, 0, 0]

# Se tienen que mostrar tres cartas en el turno 1
func initialTurn():
	for i in range(3):
		showNewCard()

# Se muestra solo una carta más a partir del turno 1
func showNewCard():
	var card = $Deck.deal_card()
	$Table.add_child(card)

func checkNewTurn():
	for i in range(AMOUNT_PLAYERS): 
		if jugadas[i] == false:
			return
	
	jugadas = [false, false, false, false]
	lastMaxApuesta = maxApuesta
	turno = turno+1
	
	$UI.enableButtons(["Pasar", "Apostar", "Retirarse"], true)
	$UI.enableButtons(["Igualar", "Subir"], false)
	
	if turno == TURNO_INICIAL:
		initialTurn()
	elif turno <= TURNO_FINAL-1:
		showNewCard()
	elif turno == TURNO_FINAL:
		# TODO: Añadir comportamiento para terminar partida 
		# (Mostrar cartas de rivales y quien ha ganado)
		pass 
	

# Función que comunica al Manager que jugada ha realizado el jugador
func _on_player_jugada(tipo, valor, jugador):
	
	if jugadas[jugador]: # Caso base, solo se realiza una jugada por turno
		return
	
	if tipo == "Apostar" or tipo == "Subir": # Primero en jugar 
		$UI.enableButtons(["Apostar"], false)
		$UI.enableButtons(["Subir"], false)
		apuestas[jugador] = valor
		maxApuesta = valor
		jugadas = [false, false, false, false]
	elif tipo == "Retirarse":
		# Comunicar que un jugador se ha ido de la partida
		pass
	# TODO: Añadir más funcionalidades para otras jugadas
	# Comunicar a resto de jugadores que un jugador se ha ido, o que jugada ha realizado
	
	jugadas[jugador] = true
	checkNewTurn()
	
