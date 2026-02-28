extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var scene := preload("res://Main/ore.tscn")
	var ore := scene.instantiate()
	$"../../OreHolder".add_child(ore)
	ore.global_position.x = get_parent().global_position.x + randf_range(-500,500)
	ore.global_position.y = get_parent().global_position.y + randf_range(1200,1500)
	$Timer.wait_time = ((1 / (Global.currentSPEED / 20) * 50) * 1 - $"..".upgore*0.1)
