@tool
extends Window

#@export var npc: Enemy
@onready var graph_edit = $GraphEdit
var visible_toggle: bool = true
var fsm_nodes: Array
var saved_position = Vector2.ZERO

#func _process(delta: float) -> void:
	#pass
	##print(graph_edit.get_connection_list())

func _ready() -> void:
	fsm_nodes = get_tree().get_nodes_in_group("FSMNode")
	for fsm_node in fsm_nodes:
		var action_on: Array = fsm_node.get_action_on_array()
		for action_on_node in action_on:
			graph_edit.connect_node(fsm_node.name,0,action_on_node.name,0)

func _on_graph_edit_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	graph_edit.connect_node(from_node, from_port, to_node, to_port)
