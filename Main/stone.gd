extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match randi_range(0,2):
		0:
			$StaticBody2D/CollisionShape2D2.queue_free()
			$StaticBody2D/CollisionShape2D3.queue_free()
		1:
			$StaticBody2D/CollisionShape2D.queue_free()
			$StaticBody2D/CollisionShape2D3.queue_free()
		2:
			$StaticBody2D/CollisionShape2D.queue_free()
			$StaticBody2D/CollisionShape2D2.queue_free()
	var sca = randf_range(2,15)
	scale = Vector2(sca,sca)
	rotation = randf_range(0,2*PI)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
