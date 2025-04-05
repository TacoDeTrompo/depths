@tool
extends MeshInstance3D
#@onready var mi_fillplane:MeshInstance3D = get_node("%sampleCutPlane")
@export var fillplaneVar:MeshInstance3D

func _process(delta):
	material_override.set_shader_parameter("fillplane",fillplaneVar.transform); 
	material_override.next_pass.set_shader_parameter("fillplane",fillplaneVar.transform);
