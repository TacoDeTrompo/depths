@tool
class_name HookHandler
extends Node3D

@export var PosHandler:Node3D
@export var links:Links
@export var tip:Area3D

@export var linksMaxLenght = 5
var currentLenght = 0
var tipLocked = false

func _process(delta: float) -> void:
	if(PosHandler != null):
		if(currentLenght>=linksMaxLenght):
			currentLenght = linksMaxLenght
			
		# Dinamically adjust links' extended based on the current PosHandler position
		PosHandler.position.x = currentLenght
		links.extended = currentLenght * 2.5 * 7.94
		
		if(tipLocked):
			tip.rotation_degrees.z = -PosHandler.rotation_degrees.z
		
