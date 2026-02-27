extends CharacterBody2D

const minSPEED = 70.0
const maxSPEED = 700.0
var currentSPEED = 200

var torotation = 0

@onready var player_camera: Camera2D = $"../PlayerCamera"


func _physics_process(delta: float) -> void:
	
	var direction := (get_global_mouse_position() - self.global_position).normalized() * 100
	if direction.y < 0:
		direction.y = 0
		
	direction.y += 35
	
	currentSPEED += (0.15 - (abs(self.rotation - (atan2(direction.y, direction.x)- PI/2)))) * delta * 50
	
	if (currentSPEED < minSPEED):
		currentSPEED = minSPEED
	elif(currentSPEED > maxSPEED):
		currentSPEED = maxSPEED
	
	torotation = atan2(direction.y, direction.x) - PI/2
	
	print(currentSPEED)
	
	self.rotation= rotate_toward(self.rotation,torotation,delta *3)
	
	player_camera.position = lerp(player_camera.position, Vector2(self.position.x, self.position.y), 0.02)
	
	velocity = Vector2.RIGHT.rotated(self.rotation + PI/2) * currentSPEED
	
	move_and_slide()
