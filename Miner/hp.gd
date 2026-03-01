extends Control

@export var rect1 : TextureRect
@export var rect2 : TextureRect
@export var rect3 : TextureRect

func _ready() -> void:
	rect1.texture = preload("res://grafiki/żarówka.png")
	rect2.texture = preload("res://grafiki/żarówka.png")
	rect3.texture = preload("res://grafiki/żarówka.png")
	Global.hp = 3

func _process(delta: float) -> void:
	if Global.game_paused == true:
		hide()
	else:
		show()
	if Global.hp == 3:
		rect1.texture = preload("res://grafiki/żarówka.png")
		rect2.texture = preload("res://grafiki/żarówka.png")
		rect3.texture = preload("res://grafiki/żarówka.png")
	elif Global.hp == 2:
		rect1.texture = preload("res://grafiki/żarówka2.png")
		rect2.texture = preload("res://grafiki/żarówka.png")
		rect3.texture = preload("res://grafiki/żarówka.png")
	elif Global.hp == 1:
		rect1.texture = preload("res://grafiki/żarówka2.png")
		rect2.texture = preload("res://grafiki/żarówka2.png")
		rect3.texture = preload("res://grafiki/żarówka.png")
	elif Global.hp == 0:
		rect1.texture = preload("res://grafiki/żarówka2.png")
		rect2.texture = preload("res://grafiki/żarówka2.png")
		rect3.texture = preload("res://grafiki/żarówka2.png")
		
