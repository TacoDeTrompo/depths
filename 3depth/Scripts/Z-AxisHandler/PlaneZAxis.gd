extends MeshInstance3D

@export var zAxisHandler : ZAxisHandler

func _process(delta):
	var currentPosition = self.global_position
	currentPosition.z = zAxisHandler.zAxis
	self.global_position = currentPosition
