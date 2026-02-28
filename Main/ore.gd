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
		
	var original_tex = $PointLight2D.texture
	var new_tex = original_tex.duplicate()
	new_tex.gradient = original_tex.gradient.duplicate()

	$PointLight2D.texture = new_tex

	var grad = new_tex.gradient

	match oretype:
		1:
			$Sprite2D.texture = preload("res://grafiki/ore1.png")
			grad.set_color(0, Color("df7126ff"))
		2:
			$Sprite2D.texture = preload("res://grafiki/ore2.png")
			grad.set_color(0, Color("f1e607ff"))
		3:
			$Sprite2D.texture = preload("res://grafiki/ore3.png")
			grad.set_color(0, Color("da21f9ff"))
		4:
			$Sprite2D.texture = preload("res://grafiki/ore4.png")
			grad.set_color(0, Color("7fff1bff"))
		5:
			$Sprite2D.texture = preload("res://grafiki/ore5.png")
			grad.set_color(0, Color("5fcde4ff"))
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
