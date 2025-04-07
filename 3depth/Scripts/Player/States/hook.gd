extends State

@export
var detachState: State

@export
var hookHandler: HookHandler

@export var ray_length: float = 1000.0

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if(!parent.is_on_floor()):
		hookHandler.currentLenght += Input.get_axis("z_backward","z_forward") * get_process_delta_time() * hookHandler.links.extendSpeed
	else:
		hookHandler.currentLenght -= float(Input.is_action_pressed("z_backward")) * get_process_delta_time() * hookHandler.links.extendSpeed
	
	if Input.is_action_just_pressed("hook"):
		return detachState
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	#var beforeMovement = hookHandler.tip.global_position
	#
	#parent.velocity.y += parent.get_gravity().y * delta
	#parent.move_and_slide() 
	#
	#var tipDifference = hookHandler.tip.global_position - beforeMovement
	#parent.position -= tipDifference
	
	# TODO: make the character move around the pin, falling to the gravity (removing x value, but keeping that on y instead and rotating the hook)
	#var test = Vector2(hookHandler.tip.global_position.x, hookHandler.tip.global_position.y)
	#var worldMousePos2d = Vector2(world_mouse_pos.x, world_mouse_pos.y)
	#var hookPosition2d = Vector2(hookHandler.global_position.x, hookHandler.global_position.y)
	#
	#hookHandler.rotation.z = hookPosition2d.angle_to_point(worldMousePos2d)
	
	
	return null
