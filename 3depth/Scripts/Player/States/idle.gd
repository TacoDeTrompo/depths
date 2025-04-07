extends State

@export
var fallState: State
@export
var jumpState: State
@export
var moveState: State
@export
var aimState: State

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.animations.set_animation("default")

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jumpState
		
	if Input.is_action_just_pressed("aim"):
		return aimState
		
	if Input.get_axis("move_left","move_right") != 0:
		return moveState
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += parent.get_gravity().y * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fallState
	return null
