extends State

@export
var idleState: State
@export
var moveState: State

func process_physics(delta: float) -> State:
	parent.velocity.y += parent.get_gravity().y * delta

	var movement = Input.get_axis('move_left', 'move_right') * parent.move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return moveState
		return idleState
	return null
