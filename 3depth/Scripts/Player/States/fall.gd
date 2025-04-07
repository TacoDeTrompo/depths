extends State

@export
var idleState: State
@export
var moveState: State

var lastKnowVerticalSpeed = 0
var hitGround = false

func enter():
	super()
	hitGround = false
	lastKnowVerticalSpeed = 0
	parent.animations.set_animation("fall")

func process_physics(delta: float) -> State:
	lastKnowVerticalSpeed = parent.velocity.y
	parent.velocity.y += parent.get_gravity().y * delta

	var movement = Input.get_axis('move_left', 'move_right') * parent.move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		hitGround = true
		if movement != 0:
			return moveState
		return idleState
	return null

func exit():
	# Check if player should take fall damage (currently lethal)
	# As long as the player has been 0.71 seconds on air (equal to 2.5 blocks vertically, enough space and a little extra to make 2 block falls)
	# and hit the ground, take damage
	if(hitGround and lastKnowVerticalSpeed <= parent.get_gravity().y*0.71):
		parent.take_damage(1)
