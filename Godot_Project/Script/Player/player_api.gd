extends CharacterBody3D

@export var patrol_nodes: Array[PatrolNode]
@export var fsm: PlayerFiniteStateMachine
@export var debug_box: DebugBox

func get_patrol_nodes() -> Array:
	return patrol_nodes

func _process(delta: float) -> void:
	fsm.update(delta)
