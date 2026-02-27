extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	var direction := (get_global_mouse_position() - self.global_position).normalized() * 100
	if direction.y < 0:
		direction.y = 0
	
	var rotation = atan2(direction.y, direction.x) - PI/2
	self.rotation= rotate_toward(self.rotation,rotation,delta *3)
	
	velocity = Vector2.RIGHT.rotated(self.rotation + PI/2) * 100
	move_and_slide()
