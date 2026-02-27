extends TileMap

@export var tile: TileMap
@export var player : CharacterBody2D

@export var hight:=  10
@export var width:= 30

var _in = true

func _process(delta: float) -> void:
	pass
	#for h in hight:
		#for w in width:
			#tile.set_cell(0,Vector2i(w,player.position.y+h),0,Vector2(1,1),0)
	#

func _ready() -> void:
	global_position = Vector2(0,0)

func detector_enter() -> void:
	pass


func detector_exited() -> void:
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,player.position.y+h),0,Vector2(1,1),0)
