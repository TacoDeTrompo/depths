extends State

@export
var idleState: State
var aimState: State
var hookState: State

@export
var hookRoot: Node3D

@export var ray_length: float = 1000.0

func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_released("hook"):
		#return idleState
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	return null
	
func process_hook(delta: float, camera: Camera3D) -> State:	
	var mouse_pos = get_viewport().get_mouse_position()
	var rayOrigin = camera.project_ray_origin(mouse_pos)
	var space = hookRoot.get_world_3d().direct_space_state
	var start = get_viewport().get_camera_3d().project_ray_origin(mouse_pos)
	var end = get_viewport().get_camera_3d().project_position(mouse_pos, 1000)
	var params = PhysicsRayQueryParameters3D.new()
	params.from = start
	params.to = end
	var result = space.intersect_ray(params)
	print(end)
	hookRoot.look_at(end)
	
	return null
