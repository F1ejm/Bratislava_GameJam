extends VBoxContainer
var itemimage: CompressedTexture2D
var itemname: String
var itemdesc: String
var isActive: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func refresh():
	$TextureRect.texture = itemimage
	$RichTextLabel.text = itemname
	$RichTextLabel2.text = itemdesc

func _on_texture_button_button_down() -> void:
	pass # Replace with function body.
