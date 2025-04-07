@tool
class_name HookHandler
extends Node3D

@export var PosHandler:Node3D
@export var links:Links
@export var tip:Area3D

@export var linksMaxLenght = 5
@export var shootSpeed = 4
var currentLenght = 0
var tipLocked = false
var didHitTarget = false
var isShooting = false
var isActive = false

func _physics_process(delta: float) -> void:
	if(PosHandler != null):
		if(isShooting): calculateShoot(delta)
		calculateLinksAndTip()

func calculateLinksAndTip():
	# Dinamically adjust links' extended based on the current PosHandler position
	PosHandler.position.x = currentLenght
	links.extended = currentLenght * 2.5 * 7.94

	if(tipLocked):
		tip.rotation_degrees.z = -PosHandler.rotation_degrees.z

func calculateShoot(delta: float):
	currentLenght += shootSpeed * delta
	if(currentLenght>=linksMaxLenght):
		resetHook()

func resetHook():
	currentLenght = 0
	links.extended = 0
	tip.rotation_degrees.z = 0
	self.rotation_degrees.z = 0
	tipLocked = false
	didHitTarget = false
	isShooting = false
	isActive = false

func _on_tip_body_entered(body: Node3D) -> void:
	#TODO: Check if the target is a valid target
	#if not, reset
	#if yes, continue
	if(body.name == "Player"):
		return
	didHitTarget = true
	isShooting = false
