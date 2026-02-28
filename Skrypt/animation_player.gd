extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play("wagon1");
	$".".play("wagon2");
	$".".play("wagon3");
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
