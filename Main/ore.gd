extends Node2D

var oretype: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refresh()
func refresh():
	var rand = randi_range(0,99)
	if(rand < 2):
		oretype = 5
	elif(rand < 8):
		oretype = 4
	elif(rand < 25):
		oretype = 3
	elif(rand < 50):
		oretype = 2
	else:
		oretype = 1
		
	var tex := $PointLight2D.texture as GradientTexture2D
	var grad := tex.gradient
	
	match oretype:
		1:
			$Sprite2D.texture = preload("res://grafiki/ore1.png")
			grad.set_color(0, Color(0.875, 0.443, 0.149, 1.0))
		2:
			$Sprite2D.texture = preload("res://grafiki/ore2.png")
			grad.set_color(0, Color(0.945, 0.902, 0.027, 1.0))
		3:
			$Sprite2D.texture = preload("res://grafiki/ore3.png")
			grad.set_color(0, Color(0.855, 0.129, 0.976, 1.0))
		4:
			$Sprite2D.texture = preload("res://grafiki/ore4.png")
			grad.set_color(0, Color(0.498, 1.0, 0.106, 1.0))
		5:
			$Sprite2D.texture = preload("res://grafiki/ore5.png")
			grad.set_color(0, Color(0.373, 0.804, 0.894, 1.0))
	
	tex.gradient = grad
	$PointLight2D.texture = tex


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
