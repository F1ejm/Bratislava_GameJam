extends Node2D

@onready var upgrade: Control = $CanvasLayer/Upgrade
var items := [
	"Faster Sterring",
	"Slow Down!!!",
	"Better Luck",
	"The Rock",
	"Brakes",
	"Invicibility",
	"Rock Smasher",
	"SPEEEEEEED!!!"]

func upgradesmenuopen():
<<<<<<< Updated upstream
	pass
	#upgrade.show()
	#get_tree().paused = true
=======
	upgrade.itemname1 = items[randi() % items.size()]
	upgrade.itemname2 = items[randi() % items.size()]
	upgrade.itemname3 = items[randi() % items.size()]
	upgrade.refresh()
	upgrade.show()
	get_tree().paused = true
>>>>>>> Stashed changes
