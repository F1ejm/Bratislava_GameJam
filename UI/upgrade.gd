extends Control

var itemname1: String
var itemname2: String
var itemname3: String

@onready var item_column: VBoxContainer = $HBoxContainer/ItemColumn
@onready var item_column_2: VBoxContainer = $HBoxContainer/ItemColumn2
@onready var item_column_3: VBoxContainer = $HBoxContainer/ItemColumn3

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
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = false
			"Slow Down!!!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/minus_speed.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = false
			"Money!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/plus_score.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = false
			"Better Luck":
				currentcollumn.itemimage = preload("res://grafiki/boosts/plus_rudy.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = false
			"Less Rock":
				currentcollumn.itemimage = preload("res://grafiki/boosts/minus_kamienie.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = false
			"Brakes":
				currentcollumn.itemimage = preload("res://grafiki/boosts/hamulec.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = true
			"Invicibility":
				currentcollumn.itemimage = preload("res://grafiki/boosts/invincibility.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive = true
			"Rock Smasher":
				currentcollumn.itemimage = null
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive =true
			"SPEEEEEEED!!!":
				currentcollumn.itemimage = preload("res://grafiki/boosts/rozpierdol.png")
				currentcollumn.itemname = currentitem
				currentcollumn.itemdesc = "null"
				currentcollumn.isActive =true
	item_column.refresh()
	item_column_2.refresh()
	item_column_3.refresh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
