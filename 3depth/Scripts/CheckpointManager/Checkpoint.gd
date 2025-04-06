class_name Checkpoint
extends Area3D

@export var overrideRespawnPointZAxis: bool = true
@export var checkpoint_manager: CheckpointManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		checkpoint_manager.last_location = $RespawnPoint.global_position
		if overrideRespawnPointZAxis:
			checkpoint_manager.last_location.z = body.global_position.z
		self.queue_free()
