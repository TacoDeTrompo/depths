extends Path3D

@export var moving_speed: float = 0.5
@export var pathFollow3D: PathFollow3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pathFollow3D.progress += moving_speed * delta
