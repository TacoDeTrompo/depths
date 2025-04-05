extends State

@export
var fallState: State
@export
var jumpState: State
@export
var idleState: State

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jumpState
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += parent.get_gravity().y * delta
	
	var movement = Input.get_axis('move_left', 'move_right') * parent.move_speed
	
	if movement == 0:
		return idleState
	
	parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fallState
	return null
