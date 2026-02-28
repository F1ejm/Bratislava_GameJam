extends TileMap

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
	
	
	var pos_cell = tile.local_to_map(player.position)
	var data = tile.get_cell_tile_data(0,pos_cell)
	if data:
		if data.get_custom_data("marek")== 1:
			player.IsFalling = true
			print(data.get_custom_data("marek"))
	else:
		player.IsFalling = false
		
	



func draw_rough_circle(center: Vector2i, r: int):
	for x in range(-r - 5, r + 5):
		for y in range(-r - 5, r + 5):
			
			var dist = Vector2(x, y).length()
			
			# dodajemy losowe "poszarpanie"
			var rough_offset = randf_range(-noise_strength, noise_strength)
			
			if dist <= r + rough_offset:
				tile.set_cell(0, center + Vector2i(x, y), 0, Vector2(2,1))
	


func _on_timer_timeout() -> void:
	var x = randi_range(-1,1)*(randi_range(100,300))
	var y = (randi_range(300,800))
	var pos = tile.local_to_map(Vector2(player.position)+Vector2(x,y))
	draw_rough_circle(pos,9)
	pos += Vector2i(10,6)
	draw_rough_circle(pos,7)
