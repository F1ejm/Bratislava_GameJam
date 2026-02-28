extends Node2D

var mouse: Vector2i

@export var tile :TileMap
@export var player : CharacterBody2D

# 2:3
var hight:=  60
var width:= 90

func _process(delta: float) -> void:
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,player.position.y+h+50),3,Vector2(0,0),0)
	

	
	
	var clicked_cell = tile.local_to_map(player.position)
	
	var tile_p = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	var tile_l = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	var tile_d = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
	#print(clicked_cell)
	
	var tile_ll = tile.get_neighbor_cell(tile_l,TileSet.CELL_NEIGHBOR_TOP_LEFT_CORNER)
	
	tile.erase_cell(0,clicked_cell)
	tile.erase_cell(0,tile_d)
	tile.erase_cell(0,tile_l)
	tile.erase_cell(0,tile_p)
	var data = tile.get_cell_tile_data(0, clicked_cell)
	
	
	
	
	
	#if data:
		##print(data.get_custom_data("Marek"))
		#pass
	#else:
		#pass
#erase_cell()

func _ready() -> void:
	global_position = Vector2(0,0)
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,h),3,Vector2(1,1),0)
	
