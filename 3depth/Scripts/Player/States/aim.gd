extends State

@export
var idleState: State
var shootState: State

@export
var hookHandler: HookHandler

@export var ray_length: float = 1000.0

@export var player: Player

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.velocity.z = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_released("aim"):
		return idleState
	if Input.is_action_just_pressed("hook"):
		return shootState
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	parent.velocity.y += parent.get_gravity().y * delta
	parent.move_and_slide()
	
	process_hook(delta, get_viewport().get_camera_3d())
	
	return null
	
func process_hook(delta: float, camera: Camera3D) -> State:	
	var mouse_pos = get_viewport().get_mouse_position()
	var world_mouse_pos = camera.project_ray_origin(mouse_pos)
	var worldMousePos2d = Vector2(world_mouse_pos.x, world_mouse_pos.y)
	var hookPosition2d = Vector2(hookHandler.global_position.x, hookHandler.global_position.y)
	
	hookHandler.rotation.z = hookPosition2d.angle_to_point(worldMousePos2d)
	
	return null
