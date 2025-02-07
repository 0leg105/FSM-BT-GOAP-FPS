extends Node
class_name CoverNodeManager

var cover_nodes: Array

func _ready() -> void:
	cover_nodes = get_tree().get_nodes_in_group("CoverNode")

# 0. Übergibt Cover für den NPC
func get_cover_for_npc(move_component: MoveComponent) -> CoverNode:
	var valid_cover: Array[CoverNode] 
	valid_cover = set_available_cover_node()
	valid_cover = sort_by_distance(valid_cover, move_component)
	if not valid_cover.is_empty():
		return valid_cover[0]
	return null

# 1. Schaut, dass nur Nodes genommen werden, die vom Spieler wnicht gesehen werden. 2 Typen von CoverNodes können gesucht werden
func set_available_cover_node() -> Array:
	var unseen_cover: Array[CoverNode] = []
	for cover_node in cover_nodes:
		if cover_node.is_valid() == true:
			unseen_cover.append(cover_node)
	return unseen_cover

# Sortiert ein Array von CoverNodes nach ihrer Distanz zu npcPos
func sort_by_distance(unseenCover: Array, move_component: MoveComponent) -> Array:
	# Bubble Sort nach Distanz
	for i in range(unseenCover.size()):
		for j in range(0, unseenCover.size() - i - 1):
			var a = unseenCover[j]
			var b = unseenCover[j + 1]
			var dist_a = move_component.get_path_length(a.global_transform.origin)
			var dist_b = move_component.get_path_length(b.global_transform.origin)
			if dist_a > dist_b:
				var temp = unseenCover[j]
				unseenCover[j] = unseenCover[j + 1]
				unseenCover[j + 1] = temp
	return unseenCover

func print_sortedCover(array: Array, npcPos: Vector3, title: String) -> void:
	print("----",title,"----")
	for i in array:
		var iPos = i.global_transform.origin
		print(i, " ", iPos.distance_to(npcPos))
