extends Node2D

var mouse: Vector2i

@export var tile :TileMap
@export var player : CharacterBody2D

func _process(delta: float) -> void:
	var clicked_cell = tile.local_to_map(tile.get_local_mouse_position())
	var data = tile.get_cell_tile_data(0, clicked_cell)
	if data:
		print(data.get_custom_data("Marek"))
	else:
		pass
	
