extends Node2D

var mouse: Vector2i

@export var tile :TileMap
@export var player : CharacterBody2D

var hight:=  60
var width:= 30

func _process(delta: float) -> void:
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,player.position.y+h+50),2,Vector2(0,0),0)
	var clicked_cell = tile.local_to_map(tile.get_local_mouse_position())
	var data = tile.get_cell_tile_data(0, clicked_cell)
	if data:
		#print(data.get_custom_data("Marek"))
		pass
	else:
		pass


func _ready() -> void:
	global_position = Vector2(0,0)
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,h),2,Vector2(1,1),0)
	
