extends CharacterBody2D

var minSPEED = 150.0
var maxSPEED = 600.0
var currentSPEED = 200.0
const maxhistory = 500
var scoref: float = 0.0

var startlock: bool = false

var upgturn: int = 0
var upgreawards: int = 0
var upgstone: int = 0
var upgore: int = 0

var breakingforce: int = 0

var torotation = 0

var AciteveItem: String

var ActiveFull: bool = false

var nextUpgrade: int = 100
var currentLevel: int = 1

var IsFalling: bool = false

var warning : bool = true

var rocksmashing: bool = false

@export var anim : AnimationPlayer

@onready var player_camera: Camera2D = $"../PlayerCamera"

@export var iskry :CPUParticles2D
@export var iskry1 : CPUParticles2D
@export var main : Node2D
@export var area :Area2D
@export var drilling_part: CPUParticles2D



func _ready() -> void:
	drilling_part.emitting = false
	global_position.x = 3500
	global_position.y -= 500
	anim.play("drill")
	startlock = true
	await get_tree().create_timer(2).timeout
	startlock = false


func _physics_process(delta: float) -> void:

	
	if IsFalling:
		main.p = true
		$CPUParticles2D.emitting = false
		if AudioManager.drill.playing == true:
			AudioManager.drill.stop()
	else:
		main.p = false
		$CPUParticles2D.emitting = true
		if AudioManager.drill.playing == false:
			AudioManager.drill.play()
	
	var direction := (get_global_mouse_position() - self.global_position).normalized() * 100
	if direction.y < 0:
		direction.y = 0
		(direction * 1000).normalized()
		
	direction.y += 35
	#print(direction)
	if(IsFalling):
		currentSPEED += delta * 150
	else:
		currentSPEED += ((0.25 - (abs(self.rotation - (atan2(direction.y, direction.x)- PI/2)))) * delta * 50) - breakingforce
	
	breakingforce /= 1.3
	
	if (currentSPEED < minSPEED):
		currentSPEED = minSPEED
	elif(currentSPEED > maxSPEED):
		currentSPEED = maxSPEED
	if(!startlock):
		torotation = atan2(direction.y, direction.x) - PI/2
	
	$Node2D.rotation = rotate_toward($Node2D.rotation,-torotation,delta * (3 + upgturn))
	
	
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
		currentLevel += 5
		nextUpgrade += currentLevel * 200
	
	move_and_slide()

func upgradesmenuopen():
	get_parent().upgradesmenuopen()

func itempicked(itemname: String, isactive: bool):
	spawnTail(1)
	if(!isactive):
		match itemname:
			"Faster Sterring":
				upgturn += 2
			"Better Luck":
				upgore += 2
			"Less Rock":
				upgstone += 2
			"Money!":
				upgreawards += 2
				
	else:
		AciteveItem = itemname
		ActiveFull = true
		$"..".items.erase("Brakes")
		$"..".items.erase("Rock Smasher")
		$"..".items.erase("SPEEEEEEED!!!")

func _input(event): 
	if event.is_action_pressed("Use_item"): 
		match AciteveItem:
			"Brakes":
				breakingforce = 80
				AudioManager.car_brake.play()
			"Rock Smasher":
				AudioManager.rock_break.play()
				rocksmashing = true
				await get_tree().create_timer(10).timeout
				rocksmashing = false
			"SPEEEEEEED!!!":
				AudioManager.speed_up.play()
				pass
		#print(AciteveItem)

func spawnTail(number: int):
	if($TailSP.get_children().is_empty()):
		#print("current")
		var scene := preload("res://Miner/tail.tscn")
		var tail := scene.instantiate()
		tail.number = number
		$TailSP.add_child(tail)		
	else:
		#print("next")
		$TailSP.get_child(0).spawnTail(number+1)


func iskra():
	iskry.emitting = true
	iskry1.emitting =true
	$Timer.start()



func _on_timer_timeout() -> void:
	iskry.emitting = false
	iskry1.emitting =false


func body_entered(body: Node2D) -> void:
	print(Global.hp)
	if body.is_in_group("Kamien"):
		if !rocksmashing:
			iskra()
			AudioManager.rock_hit.play()
			main.add_trauma(2)
			Global.hp -= 1
		else:
			body._particle()
			body.queue_free()
