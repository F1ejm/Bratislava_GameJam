extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_rotation = lerp(global_rotation,get_parent().get_parent().global_rotation,6*delta)
	$TailSP.global_rotation = 0
	
func spawnTail():
	if($TailSP.get_children().is_empty()):
		var scene := preload("res://Miner/tail.tscn")
		var tail := scene.instantiate()
		$TailSP.add_child(tail)
	else:
		$TailSP.get_child(0).spawnTail()
