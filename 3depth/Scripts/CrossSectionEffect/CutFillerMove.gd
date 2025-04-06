@tool
extends MeshInstance3D

@export var parentBody: MovingBlock
var fillplaneVar: MeshInstance3D

func _ready() -> void:
	fillplaneVar = parentBody.fillplaneVar

func _process(delta):
	if fillplaneVar != null:
		material_override.set_shader_parameter("fillplane",fillplaneVar.transform); 
		material_override.next_pass.set_shader_parameter("fillplane",fillplaneVar.transform);
