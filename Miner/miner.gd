extends CharacterBody2D

var minSPEED = 150.0
var maxSPEED = 700.0
var currentSPEED = 200.0
const maxhistory = 500
var scoref: float = 0.0

var upgturn: int = 0
var upgreawards: int = 0
var upgspeed: int = 0
var upgstone: int = 0
var upgore: int = 0
var upgcavecontrol: int = 0

var torotation = 0

var FirAciteveItem: String
var SecAciteveItem: String
var ThiAciteveItem: String
var ActiveFull: bool = false

var nextUpgrade: int = 100
var currentLevel: int = 1

var IsFalling: bool = false

var warning : bool = true

@export var anim : AnimationPlayer

@onready var player_camera: Camera2D = $"../PlayerCamera"

func _ready() -> void:
	global_position.x = 3500
	anim.play("drill")
	for i in range(0,20):
		spawnTail(1)

func _physics_process(delta: float) -> void:
	
	
	if IsFalling:
		$CPUParticles2D.emitting = false
	else:
		$CPUParticles2D.emitting = true
	
	var direction := (get_global_mouse_position() - self.global_position).normalized() * 100
	if direction.y < 0:
		direction.y = 0
		(direction * 1000).normalized()
		
	direction.y += 35
	#print(direction)
	if(IsFalling):
		currentSPEED += delta * 150
	else:
		currentSPEED += ((0.25 - (abs(self.rotation - (atan2(direction.y, direction.x)- PI/2)))) * delta * 50 * (1 + upgspeed/10))
	
	
	if (currentSPEED < minSPEED):
		currentSPEED = minSPEED
	elif(currentSPEED > maxSPEED):
		currentSPEED = maxSPEED
	
	torotation = atan2(direction.y, direction.x) - PI/2
	
	$Node2D.rotation = rotate_toward($Node2D.rotation,-torotation,delta * (3 + upgturn))
	$Node2D/PointLight2D.global_rotation += delta *3
	
	if IsFalling:
		torotation = lerp(self.rotation, 0.0, delta * 2)
	
	self.rotation= rotate_toward(self.rotation,torotation,delta * (3 + upgturn))
	
	player_camera.position.x = lerp(player_camera.position.x,self.position.x, 0.02 - ((currentSPEED / maxSPEED) * 0.005))
	
	player_camera.position.y = lerp(player_camera.position.y,self.position.y + 120, 0.04 + ((currentSPEED / maxSPEED) * 0.05))
	
	velocity = Vector2.RIGHT.rotated(self.rotation + PI/2) * currentSPEED
	
	$TailSP.global_rotation = 0
	
	Global.history.push_front(self.global_rotation)
	if(Global.history.size() > maxhistory):
		Global.history.pop_back()
	
	Global.currentSPEED = currentSPEED
	
	Global.scoremulti = round(1+((currentSPEED / 200)-1)**2)
	
	scoref += currentSPEED * Global.scoremulti /5000
	
	Global.score =round(scoref)
	
	#print(Global.score)
	
	if (Global.score > nextUpgrade):
		upgradesmenuopen()
		currentLevel += 2
		nextUpgrade += currentLevel * 200
	
	move_and_slide()

func upgradesmenuopen():
	get_parent().upgradesmenuopen()

func itempicked(itemname: String, isactive: bool):
	if(isactive):
		pass
	else:
		match itemname:
			"Brakes":
				pass
		

func setActiveItem(itemname: String):
	if(FirAciteveItem.is_empty()):
		FirAciteveItem = itemname
	elif(SecAciteveItem.is_empty()):
		SecAciteveItem = itemname
	elif(ThiAciteveItem.is_empty()):
		ThiAciteveItem = itemname
		ActiveFull = true
	


func spawnTail(number: int):
	if($TailSP.get_children().is_empty()):
		var scene := preload("res://Miner/tail.tscn")
		var tail := scene.instantiate()
		tail.number = number
		$TailSP.add_child(tail)
	else:
		$TailSP.get_child(0).spawnTail(number+1)
		
