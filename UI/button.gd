extends TextureButton

var tween: Tween
var initial_scale: Vector2 = Vector2(1, 1)

func _ready() -> void:
	reset_tween()
	pivot_offset_ratio = Vector2(0.5, 0.5)
	initial_scale = scale
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_mouse_entered():
	reset_tween()
	tween.tween_property(self, "scale", initial_scale * Vector2(1.3, 1.3), get_process_delta_time() * 10)
	tween.tween_property(self, "scale", initial_scale * Vector2(1.1, 1.1), get_process_delta_time() * 20)

func _on_mouse_exited():
	reset_tween()
	tween.tween_property(self, "scale", initial_scale, get_process_delta_time() * 20)
