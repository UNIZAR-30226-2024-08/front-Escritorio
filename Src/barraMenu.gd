extends Control

@export var cantidadFichas = str(20)
@export var nombreUsuario = "NombreUsuario"
@export var nombrePagina = "Pagina"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_nombre_usuario(nombreUsuario)
	set_imagen_usuario()
	set_cantidad_fichas(cantidadFichas)
	set_pagina_actual(nombrePagina)


func set_nombre_usuario(newNombreUsuario : String):
	$MarginContainer/Usuario/MarginContainer/Nombre.text = newNombreUsuario


func set_imagen_usuario():
	pass


func set_cantidad_fichas(newCantidadFichas : String):
	$MarginContainer/Fichas/MarginContainer/Cantidad.text = newCantidadFichas


func set_pagina_actual(newNombrePagina : String):
	$MarginContainer/NombrePagina.text = newNombrePagina
