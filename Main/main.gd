extends Node2D

@export var decay: float = 0.8
@export var max_offset : Vector2 = Vector2(100,75)
@export var max_roll : float = 0.1
@export var follow_node : Node2D

var trauma = 0.0
var trauma_power = 2

func _process(delta: float) -> void:
	#add_trauma(4)
	
	if follow_node:
		global_position = follow_node.global_position
	
	if trauma:
		trauma  = max(trauma - decay * delta,0)
		shake()

func add_trauma(amount:float):
	trauma = min(trauma +amount, 1.0)

func shake():
	var amount = pow(trauma,trauma_power)
	$PlayerCamera.rotation = max_roll * amount * randf_range(-1,1)
	$PlayerCamera.offset.x = max_offset.x * amount * randf_range(-1,1)
	$PlayerCamera.offset.y = max_offset.y * amount * randf_range(-1,1)
	


@onready var upgrade: Control = $CanvasLayer/Upgrade
var items := [
	"Faster Sterring",
	"Better Luck",
	"Less Rock",
	"Money!",
	"Brakes",
	"Rock Smasher",
	"SPEEEEEEED!!!"]
	

func _ready() -> void:
	$PlayerCamera.position = $Miner.position

func upgradesmenuopen():
	#upgrade.show()
	#get_tree().p aused = true
	upgrade.itemname1 = "Rock Smasher"
	upgrade.itemname1 = items[randi() % items.size()]
	upgrade.itemname2 = items[randi() % items.size()]
	upgrade.itemname3 = items[randi() % items.size()]
	while(upgrade.itemname1 == upgrade.itemname2 or upgrade.itemname2 == upgrade.itemname3 or upgrade.itemname1 == upgrade.itemname3):
		upgrade.itemname1 = items[randi() % items.size()]
		upgrade.itemname2 = items[randi() % items.size()]
		upgrade.itemname3 = items[randi() % items.size()]
	upgrade.refresh()
	upgrade.show()
	get_tree().paused = true
	


func BAZA(area: Area2D) -> void:
	pass # Replace with function body.
