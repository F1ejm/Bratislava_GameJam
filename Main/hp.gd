extends Control

@export var hp1 : TextureRect
@export var hp2 : TextureRect
@export var hp3 : TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp1.texture = preload("res://grafiki/żarówka.png")
	hp2.texture = preload("res://grafiki/żarówka.png")
	hp3.texture = preload("res://grafiki/żarówka.png")
	
