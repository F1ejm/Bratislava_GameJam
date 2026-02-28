extends Control

var tween: Tween
@onready var play: TextureButton = $VBoxContainer/Play
@onready var options_help: TextureButton = $VBoxContainer/OptionsHelp
var play_initial_pos
var optionshelp_initial_pos

func _ready() -> void:
	play_initial_pos = play.position
	optionshelp_initial_pos = options_help.position

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_play_pressed() -> void:
	reset_tween()
	tween.set_parallel(false)
	tween.tween_property(play, "position", Vector2(-500, play_initial_pos.y), get_process_delta_time() * 15)
