extends TileMap

@export var detector: VisibleOnScreenNotifier2D
@export var tile: TileMap
@export var player : CharacterBody2D


func _ready() -> void:
	global_position = Vector2(0,0)
	
	tile.set_cell(0,Vector2i(10,1),0)



func detector_entered() -> void:
	tile.set_cell(0,Vector2i(0,0),0,Vector2(1,1),0)
