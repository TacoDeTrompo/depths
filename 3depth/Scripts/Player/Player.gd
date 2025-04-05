extends CharacterBody3D


const SPEED = 1.0
const JUMP_VELOCITY = 0.5

@export var zAxisHandler: ZAxisHandler


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_dir:
		velocity.x = input_dir.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var currentPosition = self.global_position
	currentPosition.z = zAxisHandler.zAxis
	self.global_position = currentPosition

	move_and_slide()
