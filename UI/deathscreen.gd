extends Control

@export var label : Label

func _process(delta: float) -> void:
	label.text  = str(Global.score)
	


func _on_button_button_down() -> void:
	var back = preload("res://Main/Main.tscn").instantiate()
	get_tree().root.add_child(back)
