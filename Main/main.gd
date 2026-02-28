extends Node2D

@onready var upgrade: Control = $CanvasLayer/Upgrade

func upgradesmenuopen():
	upgrade.show()
	get_tree().paused = true
