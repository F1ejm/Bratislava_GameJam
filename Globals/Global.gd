extends Node

var master_volume: int = 30
var music_volume: int = 30
var sfx_volume: int = 30

var health
var history = []
var currentSPEED = 200.0
var score: int = 0
var scoremulti: int = 0

var game_paused: bool = true

var hp: int = 3

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func unpause_game():
	game_paused = false
	get_tree().paused = false
