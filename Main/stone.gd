extends Node2D

@export var particle: CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match randi_range(0,2):
		0:
			$CollisionShape2D2.queue_free()
			$CollisionShape2D3.queue_free()
		1:
			$CollisionShape2D.queue_free()
			$CollisionShape2D3.queue_free()
		2:
			$CollisionShape2D.queue_free()
			$CollisionShape2D2.queue_free()
	var sca = randf_range(2,15)
	scale = Vector2(sca,sca)
	rotation = randf_range(0,2*PI)


func _process(delta: float) -> void:
	pass
	

func _particle():
	particle.emitting = true
