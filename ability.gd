extends Control

var texture
@onready var texture_rect: TextureRect = $TextureRect
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

var on_cooldown: bool = false
var cooldown_time: int = 15
var cooldown_timer: float = 0.0

func _ready() -> void:
	texture_rect.texture = texture
	texture_progress_bar.texture_progress = texture

func _process(delta: float) -> void:
	if on_cooldown:
		cooldown_timer -= delta
	
	texture_progress_bar.value = (cooldown_timer / cooldown_timer) * 100
	
	if cooldown_timer <= 0:
		on_cooldown = false
		texture_progress_bar.value = 100

func start_anim():
	if on_cooldown:
		return
	
	start_cooldown()

func start_cooldown():
	on_cooldown = true
	cooldown_timer = cooldown_time
	texture_progress_bar.value = 100
