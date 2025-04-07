extends State

@export
var fallState: State
@export
var idleState: State

@export
var hookHandler: HookHandler

@export var ray_length: float = 1000.0

func enter():
	super()
	hookHandler.resetHook()
	pass
	
func process_frame(delta: float) -> State:
	if(parent.is_on_floor()):
		return idleState
	
	return fallState
