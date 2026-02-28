extends Node2D

@onready var stone_holder: Node2D = $"../../StoneHolder"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var scene := preload("res://Main/Stone.tscn")
	var stone := scene.instantiate()
	$"../../StoneHolder".add_child(stone)
	stone.global_position.x = get_parent().global_position.x + randf_range(-500,500)
	stone.global_position.y = get_parent().global_position.y + randf_range(1200,1500)
	$Timer.wait_time = ((1 / (Global.currentSPEED / 20) * 25) * 1 + $"..".upgstone*0.1)
