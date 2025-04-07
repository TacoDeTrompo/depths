extends State

@export
var idleState: State
var aimState: State
var hookState: State

@export
var hookHandler: HookHandler

@export var ray_length: float = 1000.0

func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_released("hook"):
		#return idleState
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	return null
	
func process_hook(delta: float, camera: Camera3D) -> State:	
	# TODO: Actually shoot the damn hook
	return null
