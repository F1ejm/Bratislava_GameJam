extends TileMap

@export var tile: TileMap
@export var player : CharacterBody2D

@export var hight:=  10
@export var width:= 80

var m = false

func _process(delta: float) -> void:
	for h in hight:
		for w in width:
			tile.set_cell(0,Vector2i(w,player.position.y+h),0,Vector2(randi_range(0,7),randi_range(2,7)),0)
	for h in hight:
		tile.set_cell(0,Vector2i(-1,player.position.y + h),4,Vector2i(3,randi_range(0,7)),0)
		tile.set_cell(0,Vector2i(80,player.position.y + h),3,Vector2i(0,randi_range(0,7)),0)
	


func _ready() -> void:
	$Timer.start()
	global_position = Vector2(0,0)
	player.position.x = 500
	for h in 100:
		for w in width:
			tile.set_cell(0,Vector2i(w,h),0,Vector2(randi_range(0,7),randi_range(2,7)),0)
	for h in 60:
		tile.set_cell(0,Vector2i(-1, h),4,Vector2i(3,randi_range(0,7)),0)
		tile.set_cell(0,Vector2i(80, h),3,Vector2i(0,randi_range(0,7)),0)
	


func _on_timer_timeout() -> void:
	m = true
