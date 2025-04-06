class_name ZAxisHandler
extends Node

@export var zAxis: float = 0.0
@export var zSpeed: float = 0.5

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(player != null && player.state_machine != null && player.state_machine.current_state != null):
		var current_state = player.state_machine.current_state.name
		if( current_state == "aim" || current_state == "shoot" || current_state == "hook" || current_state == "detach"):
			return #Don't allow Z movement during these states
	
	if Input.is_action_pressed("z_backward"):
		zAxis += zSpeed * delta
	elif Input.is_action_pressed("z_forward"):
		zAxis -= zSpeed * delta
	
