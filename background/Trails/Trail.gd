extends Node2D

var mouse: Vector2i

@export var tile :TileMap
@export var player : CharacterBody2D

# 2:3
var hight:=  60
var width:= 90

var cave :=1

func _process(delta: float) -> void:
	
	#for h in hight:
		#for w in width:
			#tile.set_cell(0,Vector2i(w,player.position.y+h+50),3,Vector2(randi_range(0,7),randi_range(2,7)),0)
	
	var clicked_cell = tile.local_to_map(player.position)
	var tile_p = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	var tile_l = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	var tile_d = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
	
	
	tile.set_cell(0,clicked_cell,3,Vector2(2,0),0)
	tile.set_cell(0,tile_d,3,Vector2(2,0),0)
	tile.set_cell(0,tile_l,3,Vector2(2,0),0)
	tile.set_cell(0,tile_p,3,Vector2(2,0),0)
	
	#tile.erase_cell(0,clicked_cell)
	var data = tile.get_cell_tile_data(0, clicked_cell)
	
	#if data:
		#print(data.get_custom_data("Marek"))
		#pass
	#else:
		#pass
#erase_cell()

func _ready() -> void:
	global_position = Vector2(0,0)
	#for h in hight:
		#for w in width:
			#tile.set_cell(0,Vector2i(w,h),3,Vector2(randi_range(0,7),randi_range(2,7)),0)


func timeout() -> void:
	var x = randi_range(-1,1)*(randi_range(100,300))
	var y = (randi_range(300,800))
	var pos = tile.local_to_map(Vector2(player.position)+Vector2(x,y))
	print(player.position)
	print(pos)
	
	var r = randi_range(10,20)
	var t = randi_range(10,20)
	
	for u in range(3,r):
		for h in range(3,t):
			tile.set_cell(0,pos+Vector2i(u,h),3,Vector2i(2,1),0)
			
	var left = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	var down = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
	var top = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_TOP_SIDE)
	
	for b in range(3,randi_range(6,15)):
		
		
	
