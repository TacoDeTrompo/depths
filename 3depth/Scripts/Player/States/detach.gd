extends State

@export
var fallState: State

@export
var hookRoot: Node3D

@export var ray_length: float = 1000.0

func enter():
	# TODO: Clear the entire hook stuff, then let the state to go through fallState on the next frame
	pass
	
func process_frame(delta: float) -> State:
	return fallState
