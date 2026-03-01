extends Control

@onready var rich_text_label: RichTextLabel = $RichTextLabel

var tag1: String
var tag2: String

func _process(delta: float) -> void:
	if Global.game_paused == true:
		hide()
	else:
		show()
	
	match Global.scoremulti:
		1:
			tag1 = ""
			tag2 = ""
		2:
			tag1 = "[color=yellow]"
			tag2 = "[/color]"
		3:
			tag1 = "[color=orange]"
			tag2 = "[/color]"
		4:
			tag1 = "[color=red]"
			tag2 = "[/color]"
		5:
			tag1 = "[color=red][wave amp=15 freq=15]"
			tag2 = "[/wave][/color]"
	
	rich_text_label.text = tag1 + "x" + str(Global.scoremulti) + tag2 + " " + str(int(round(Global.score)))
