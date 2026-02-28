extends TileMap

@export var tile: TileMap
@export var player : CharacterBody2D

@export var hight:=  70
@export var width:= 60

func _process(delta: float) -> void:
	#if player.position.y == marker.position.y:
		#print("fd")
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,player.position.y+h+50),0,Vector2(randi_range(0,7),randi_range(2,7)),0)

func _ready() -> void:
	global_position = Vector2(0,0)
	player.position.x = 500
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,h),0,Vector2(randi_range(0,7),randi_range(2,7)),0)
