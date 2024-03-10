extends Control

@export var apostar : Node
@export var pasar : Node
@export var subir : Node
@export var igualar : Node
@export var retirarse : Node

# Pone la visibilidad de todos los botones a enable
func enableButtons(buttonArray, enable):
	for button in buttonArray:
		if button == "Apostar":
			apostar.visible = enable
		elif button == "Pasar":
			pasar.visible = enable
		elif button == "Subir":
			subir.visible = enable
		elif button == "Igualar":
			igualar.visible = enable
		elif button == "Retirarse":
			retirarse.visible = enable

