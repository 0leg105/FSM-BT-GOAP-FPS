extends Node3D
class_name AutoGoComponent

@export var character_body: CharacterBody3D
var go_nodes: Array[PatrolNode] = []
var current_node_index: int = 0
var go_node_entered: bool = false

func _enter_tree() -> void:
	go_nodes = character_body.get_patrol_nodes()

func get_patrol_node_pos() -> Vector3:
	if go_node_entered:
		current_node_index = randi_range(0, go_nodes.size()-1)
		set_node_entered(false)
		return go_nodes[current_node_index].global_transform.origin
	return go_nodes[current_node_index].global_transform.origin

func set_node_entered(entered: bool) -> void:
	go_node_entered = entered
