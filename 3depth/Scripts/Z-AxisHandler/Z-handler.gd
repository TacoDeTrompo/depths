class_name ZAxisHandler
extends Node

@export var zAxis: float = 0.0
@export var zSpeed: float = 0.5

@export var player: Player
@export var zAxisMovementEnabled: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if zAxisMovementEnabled:
		if Input.is_action_pressed("z_backward"):
			zAxis += zSpeed * delta
		elif Input.is_action_pressed("z_forward"):
			zAxis -= zSpeed * delta
	
