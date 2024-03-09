extends Node

signal jugada(tipo, valor, jugador)

var deck

func _ready():
	deck = get_node("../Deck")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		add_child(deck.dealCard())

func getInitialHand() -> void:
	
	# Se reparten dos cartas a cada jugador en texas hold em
	var card = deck.deal_card()
	
	add_child(deck.deal_card())


######################
## Jugadas posibles ##
######################

# TODO: Añadir funcionalidad para indicar cuanto dinero apostar
# También capar dicho dinero a cantidad minima para apostar y 
# cantidad máxima de monedas del usuario
func _on_apostar_pressed():
	jugada.emit("Apostar")

func _on_pasar_pressed():
	jugada.emit("Pasar")

func _on_subir_pressed():
	jugada.emit("Subir")

func _on_igualar_pressed():
	jugada.emit("Igualar")

func _on_retirarse_pressed():
	jugada.emit("Retirarse")
