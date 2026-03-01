extends Node2D
var number: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(Global.history.size() >= int(round(number*12/(Global.currentSPEED/200))) and int(round(number*12/(Global.currentSPEED/200))) > 0):
		global_rotation = Global.history[int(round(number*12/(Global.currentSPEED/200)))-1]
	$TailSP.global_rotation = 0
	
	
func spawnTail(number: int):
	if($TailSP.get_children().is_empty()):
		var scene := preload("res://Miner/tail.tscn")
		var tail := scene.instantiate()
		tail.number = number
		$TailSP.add_child(tail)
	else:
		$TailSP.get_child(0).spawnTail(number+1)
