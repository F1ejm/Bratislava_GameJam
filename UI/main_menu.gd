extends Control

var tween: Tween
@onready var play: TextureButton = $Play
@onready var options: TextureButton = $Options
@onready var quit: TextureButton = $Quit
var play_initial_pos
var options_initial_pos
var quit_initial_pos

func _ready() -> void:
	play_initial_pos = play.position
	options_initial_pos = options.position
	quit_initial_pos = quit.position

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_play_pressed() -> void:
	reset_tween()
	tween.set_parallel(false)
	tween.tween_property(play, "position", Vector2(-500, play_initial_pos.y), get_process_delta_time() * 15)
	tween.tween_property(options, "position", Vector2(-500, options_initial_pos.y), get_process_delta_time() * 15)
	tween.tween_property(quit, "position", Vector2(-500, quit_initial_pos.y), get_process_delta_time() * 15)


func _on_options_pressed() -> void:
	reset_tween()
	tween.set_parallel(false)
	tween.tween_property(play, "position", Vector2(-500, play_initial_pos.y), get_process_delta_time() * 15)
	tween.tween_property(options, "position", Vector2(-500, options_initial_pos.y), get_process_delta_time() * 15)
	tween.tween_property(quit, "position", Vector2(-500, quit_initial_pos.y), get_process_delta_time() * 15)


func _on_quit_pressed() -> void:
	get_tree().quit()
