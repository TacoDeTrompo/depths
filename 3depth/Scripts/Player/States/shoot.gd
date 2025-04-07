extends State

@export
var idleState: State
@export
var aimState: State
@export
var hookState: State

@export
var hookHandler: HookHandler

@export var ray_length: float = 1000.0

func enter() -> void:
	super()
	hookHandler.isShooting = true

func process_input(event: InputEvent) -> State:
	# Cancel hook mid way, should probably imprement a debounce or it will be weird
	#if Input.is_action_just_pressed("hook"):
		#hookHandler.resetHook()
		#return idleState
	return null

func process_frame(delta: float) -> State:
	if(!hookHandler.isShooting):
		if(hookHandler.didHitTarget): return hookState
		
		hookHandler.resetHook()
		if(Input.is_action_pressed("aim")): return aimState
		return idleState
		
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	parent.velocity.y += parent.get_gravity().y * delta
	parent.move_and_slide()	
	return null
	
