extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.game_paused == true:
		hide()
	else:
		show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game_paused == true:
		hide()
	else:
		show()
func changepic(pic: String):
	$MarginContainer/VBoxContainer/TextureRect2.texture = load(pic)
	
func item_turned_on(seconds: int):
	$MarginContainer/ColorRect.visible = true
	await get_tree().create_timer(seconds).timeout
	$MarginContainer/ColorRect.visible = false
	
func fill_progress_bar(seconds: float):
	$MarginContainer/ProgressBar.value = 100.0
	var tween := create_tween()
	tween.tween_property($MarginContainer/ProgressBar, "value", $MarginContainer/ProgressBar.min_value, seconds)
