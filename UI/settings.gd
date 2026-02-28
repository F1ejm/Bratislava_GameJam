extends Control

@onready var master: HSlider = $VBoxContainer/HSlider
@onready var music: HSlider = $VBoxContainer/HSlider2
@onready var sfx: HSlider = $VBoxContainer/HSlider3

@export var main_menu: Control

func _ready() -> void:
	master.value = Global.master_volume
	music.value = Global.music_volume
	sfx.value = Global.sfx_volume

func _on_h_slider_value_changed(value: float) -> void:
	Global.master_volume = value
	AudioServer.set_bus_volume_linear(0, value / 100)

func _on_h_slider_2_value_changed(value: float) -> void:
	Global.music_volume = value
	AudioServer.set_bus_volume_linear(1, value / 100)

func _on_h_slider_3_value_changed(value: float) -> void:
	Global.sfx_volume = value
	AudioServer.set_bus_volume_linear(2, value / 100)

func _on_texture_button_pressed() -> void:
	main_menu.back()
