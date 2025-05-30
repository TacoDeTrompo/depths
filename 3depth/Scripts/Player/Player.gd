class_name Player
extends CharacterBody3D

@onready
var animations = $Animations
@onready
var state_machine: StateMachine = $StateMachine
@onready var HookPos: Array[Node3D] = [$HookPos2, $HookPos1]
@onready var hookHandler: HookHandler = $Hook

@export var move_speed = 1.0
@export var jump_velocity = 3.5
@export var health = 1

@export var zAxisHandler: ZAxisHandler

signal onDeath(player: Player, zAxisHandler: ZAxisHandler)

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	# Regardless of what will happen on the state, we need to link the player with the z plane using the zAxisHandler
	# So as of right now, it will be separeted from the state machine
	# It could be changed however
	var currentPosition = self.global_position
	currentPosition.z = zAxisHandler.zAxis
	self.global_position = currentPosition
	
	# Now send it to the state
	state_machine.process_physics(delta)
	zAxisHandler.zAxis = self.global_position.z
	velocity.z = 0.0

func _process(delta: float) -> void:
	# TODO: Dies
	if(health<=0):
		health = 0;
		onDeath.emit(self, zAxisHandler)
	
	if(!hookHandler.isActive):
		hookHandler.position = HookPos[0].position if !animations.flip_h else HookPos[1].position
		hookHandler.rotation = HookPos[0].rotation if !animations.flip_h else HookPos[1].rotation
	
	state_machine.process_frame(delta)

func take_damage(dmg: int):
	health -= dmg
