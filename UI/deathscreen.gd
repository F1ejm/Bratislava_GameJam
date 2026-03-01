extends Control

@export var label : Label
@onready var back = preload("res://Main/Main.tscn").instantiate()

func _process(delta: float) -> void:
	label.text  = str(int(Global.score))
	


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Main/Main.tscn")
	Global.game_paused = true
	Global.score = 0
