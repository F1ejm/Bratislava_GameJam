extends CharacterBody2D

const minSPEED = 70.0
const maxSPEED = 700.0
var currentSPEED = 200.0
const maxhistory = 1000

var torotation = 0

@onready var player_camera: Camera2D = $"../PlayerCamera"

func _ready() -> void:
	for i in range(0,10):
		spawnTail(1)

func _physics_process(delta: float) -> void:
	
	var direction := (get_global_mouse_position() - self.global_position).normalized() * 100
	if direction.y < 0:
		direction.y = 0
		(direction * 1000).normalized()
		
	direction.y += 35
	print(direction)
	
	currentSPEED += (0.35 - (abs(self.rotation - (atan2(direction.y, direction.x)- PI/2)))) * delta * 50
	
	if (currentSPEED < minSPEED):
		currentSPEED = minSPEED
	elif(currentSPEED > maxSPEED):
		currentSPEED = maxSPEED
	
	torotation = atan2(direction.y, direction.x) - PI/2
	
	self.rotation= rotate_toward(self.rotation,torotation,delta *3)
	
	player_camera.position.x = lerp(player_camera.position.x,self.position.x, 0.02 - ((currentSPEED / maxSPEED) * 0.005))
	
	player_camera.position.y = lerp(player_camera.position.y,self.position.y, 0.04 + ((currentSPEED / maxSPEED) * 0.05))
	
	velocity = Vector2.RIGHT.rotated(self.rotation + PI/2) * currentSPEED
	
	$TailSP.global_rotation = 0
	
	Global.history.push_front(self.global_rotation)
	if(Global.history.size() > maxhistory):
		Global.history.pop_back()
	
	Global.currentSPEED = currentSPEED
	
	move_and_slide()
	
func spawnTail(number: int):
	if($TailSP.get_children().is_empty()):
		var scene := preload("res://Miner/tail.tscn")
		var tail := scene.instantiate()
		tail.number = number
		$TailSP.add_child(tail)
	else:
		$TailSP.get_child(0).spawnTail(number+1)
