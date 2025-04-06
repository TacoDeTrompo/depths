extends Node3D

@export var state_machine: StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print(state_machine.current_state)
	var camera = get_viewport().get_camera_3d()
	if state_machine != null:
		state_machine.process_hook(delta, camera)
