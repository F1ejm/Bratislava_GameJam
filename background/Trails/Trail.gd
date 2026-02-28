extends Node2D

var mouse: Vector2i

@export var tile :TileMap
@export var player : CharacterBody2D

# 2:3
var hight:=  60
var width:= 90

var cave :=1

@export var radius: int = 20
@export var noise_strength: float = 1.05
@export var tile_id: int = 0
@export var atlas_coords: Vector2i = Vector2i(0, 0)

func _ready():
	randomize()
	global_position = Vector2(0,0)

func _process(delta: float) -> void:

	if player.IsFalling:
		pass
	elif player.global_position.y < -20:
		pass
	else:
		var clicked_cell = tile.local_to_map(player.position)
		var tile_p = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
		var tile_l = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
		var tile_d = tile.get_neighbor_cell(clicked_cell,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
		
		
		tile.set_cell(0,clicked_cell,3,Vector2(2,0),0)
		tile.set_cell(0,tile_d,3,Vector2(2,0),0)
		tile.set_cell(0,tile_l,3,Vector2(2,0),0)
		tile.set_cell(0,tile_p,3,Vector2(2,0),0)
	

	


#func timeout() -> void:
	#
	#var x = randi_range(-1,1)*(randi_range(100,300))
	#var y = (randi_range(300,800))
	#var pos = tile.local_to_map(Vector2(player.position)+Vector2(x,y))
	#draw_rough_circle(pos,9)
	#pos += Vector2i(10,6)
	#draw_rough_circle(pos,7)
	##print(player.position)
	##print(pos)
	##
	##var r = randi_range(20,40)
	##var t = randi_range(20,30)
	##
	##for u in range(3,r):
		##for h in range(3,t):
			##tile.set_cell(0,pos+Vector2i(u,h),3,Vector2i(2,1),0)
			##
	##var left = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	##var down = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
	##var top = tile.get_neighbor_cell(pos,TileSet.CELL_NEIGHBOR_TOP_SIDE)
	##
	##for b in range(4,randi_range(10,20)):
		##tile.set_cell(0,left+Vector2i(3,b),3,Vector2i(2,1),0)
		##tile.set_cell(0,left+Vector2i(2,b-1),3,Vector2i(2,1),0)
		##tile.set_cell(0,left+Vector2i(1,b-2),3,Vector2i(2,1),0)
		##
		##tile.set_cell(0,top+Vector2i(b,3),3,Vector2i(2,1),0)
		##tile.set_cell(0,top+Vector2i(b-1,2),3,Vector2i(2,1),0)
		##tile.set_cell(0,top+Vector2i(b-2,1),3,Vector2i(2,1),0)
		#
		#
#
#func draw_rough_circle(center: Vector2i, r: int):
	#for x in range(-r - 5, r + 5):
		#for y in range(-r - 5, r + 5):
			#
			#var dist = Vector2(x, y).length()
			#
			## dodajemy losowe "poszarpanie"
			#var rough_offset = randf_range(-noise_strength, noise_strength)
			#
			#if dist <= r + rough_offset:
				#tile.set_cell(0, center + Vector2i(x, y), 3, Vector2(2,1))
	#
