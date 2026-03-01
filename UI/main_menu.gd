extends Control

var tween: Tween
@onready var play: TextureButton = $Play
@onready var options_help: TextureButton = $OptionsHelp
@onready var camera_2d: Camera2D = $Camera2D

var play_initial_pos
var optionshelp_initial_pos
var cam_initial_pos
var initial_pos

@export var player_cam: Camera2D

func _ready() -> void:
	camera_2d.make_current()
	initial_pos = position
	play_initial_pos = play.position
	optionshelp_initial_pos = options_help.position
	cam_initial_pos = camera_2d.position

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_play_pressed() -> void:
	reset_tween()
	tween.set_parallel(false)
	tween.tween_property(play, "position", Vector2(-500, play_initial_pos.y), get_process_delta_time() * 15)
	tween.tween_property(options_help, "position", Vector2(-500, optionshelp_initial_pos.y), get_process_delta_time() * 15)
	tween.set_parallel(true)
	tween.tween_property(camera_2d, "zoom", player_cam.zoom, get_process_delta_time() * 30)
	tween.tween_property(camera_2d, "position", player_cam.position, get_process_delta_time() * 30)
	await tween.finished
	Global.unpause_game()
	player_cam.make_current()


func _on_options_help_pressed() -> void:
	reset_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", initial_pos + Vector2(1100, 0), get_process_delta_time() * 30)
	tween.tween_property(camera_2d, "position", cam_initial_pos - Vector2(1100, 0), get_process_delta_time() * 30)

func back():
	reset_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", initial_pos, get_process_delta_time() * 30)
	tween.tween_property(camera_2d, "position", cam_initial_pos, get_process_delta_time() * 30)
