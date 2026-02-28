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
	#upgrade.show()
	#get_tree().p aused = true
	upgrade.itemname1 = "Rock Smasher"
	while(upgrade.itemname1 == upgrade.itemname2 or upgrade.itemname2 == upgrade.itemname3 or upgrade.itemname1 == upgrade.itemname3):
		upgrade.itemname1 = items[randi() % items.size()]
		upgrade.itemname2 = items[randi() % items.size()]
		upgrade.itemname3 = items[randi() % items.size()]
		print("marek")
		
	upgrade.refresh()
	upgrade.show()
	get_tree().paused = true
