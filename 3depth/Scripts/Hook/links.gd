@tool
class_name Links
extends Sprite3D

@export var extended : float = 0
@export var extendSpeed : float = 1.0
@export var linkInitialOffset : float = -0.04
@export var linkOffset : float = 0.025


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#TODO: Fix this in a proper way, for some reason when extended = 0 the links don't properly reset in lenght
	var tempExtended = extended
	if(extended == 0): tempExtended = 0.001
	
	region_rect = Rect2(0, 0, 16 * tempExtended, 16)
	var currentPos = position
	currentPos.x = linkInitialOffset - (linkOffset * (tempExtended - 1))
	position = currentPos
	
