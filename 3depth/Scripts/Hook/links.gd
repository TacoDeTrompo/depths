@tool
extends Sprite3D

@export var extended : float = 1.0
@export var extendSpeed : float = 1.0
@export var linkInitialOffset : float = -0.079
@export var linkOffset : float = 0.040


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	region_rect = Rect2(0, 0, 8, 8 * extended)
	var currentPos = position
	currentPos.x = linkInitialOffset - (linkOffset * (extended - 1))
	position = currentPos
	
