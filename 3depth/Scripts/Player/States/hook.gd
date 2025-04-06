extends State

@export
var detachState: State

@export
var hookRoot: Node3D

@export var ray_length: float = 1000.0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_released("hook"):
		return detachState
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	# TODO: hang on the hook, allow to extend/reduce the chain
	return null
