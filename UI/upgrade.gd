extends Control

var itemname1: String
var itemname2: String
var itemname3: String

@export var item_column: VBoxContainer 
@export var item_column_2: VBoxContainer 
@export var item_column_3: VBoxContainer 

var currentcollumn: VBoxContainer
var currentitem: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func refresh():
	for i in range(0,3):
		match i:
			0:
				currentitem = itemname1
				currentcollumn = item_column
			1:
				currentitem = itemname2
				currentcollumn = item_column_2
			2:
				currentitem = itemname3
				currentcollumn = item_column_3
		match currentitem:
			"Faster Sterring":
				currentcollumn.itemimage = preload("res://grafiki/boosts/plus_skret.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Makes your drill more maneuverable"
				currentcollumn.isActive = false
			"Slow Down!!!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/minus_speed.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Slows drill down"
				currentcollumn.isActive = false
			"Money!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/plus_score.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Increases your score"
				currentcollumn.isActive = false
			"Better Luck":
				currentcollumn.itemimage = preload("res://grafiki/boosts/plus_rudy.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Increase chances of spawning ores "
				currentcollumn.isActive = false
			"Less Rock":
				currentcollumn.itemimage = preload("res://grafiki/boosts/minus_kamienie.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Removes some of the rocks before you can notice them"
				currentcollumn.isActive = false
			"Brakes":
				currentcollumn.itemimage = preload("res://grafiki/boosts/hamulec.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "When you preess spacebar it makes drill move slower"
				currentcollumn.isActive = true
			"Invicibility":
				currentcollumn.itemimage = preload("res://grafiki/boosts/invincibility.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Makes you invincible for some time spacebar"
				currentcollumn.isActive = true
			"Rock Smasher":
				currentcollumn.itemimage = preload("res://grafiki/boosts/rock_break.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "For sometime you are able to destroy rocks spacebar"
				currentcollumn.isActive =true
			"SPEEEEEEED!!!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/rozpierdol.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "Gives you extra speed spacebar"
				currentcollumn.isActive =true
	item_column.refresh()
	item_column_2.refresh()
	item_column_3.refresh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
