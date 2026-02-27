extends TileMap

@export var detector: VisibleOnScreenNotifier2D
@export var tile: TileMap
@export var player : CharacterBody2D

@export var hight:=  10
@export var width:= 10

func _ready() -> void:
	global_position = Vector2(0,0)


func detector_entered() -> void:
	tile.set_cell(0,Vector2i(0,0),0,Vector2(1,1),0)
	
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,h),0,Vector2(1,1),0)
	
	detector.queue_free()
			
			 
