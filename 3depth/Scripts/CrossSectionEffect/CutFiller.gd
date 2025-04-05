@tool
extends MeshInstance3D
@onready var mi_fillplane:MeshInstance3D = get_node("%sampleCutPlane")

func _process(delta):
	material_override.set_shader_parameter("fillplane",mi_fillplane.transform); 
	material_override.next_pass.set_shader_parameter("fillplane",mi_fillplane.transform);
