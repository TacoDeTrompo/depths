class_name CheckpointManager
extends Node

@export var initial_location: Vector3
var last_location: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_location = initial_location


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_on_death(player: Player, zAxisHandler: ZAxisHandler) -> void:
	player.global_position = last_location
	zAxisHandler.zAxis = last_location.z
	player.health = 1
