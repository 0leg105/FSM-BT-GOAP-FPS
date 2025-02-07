extends Node
class_name GlobalCoordinator

@export var player: CharacterBody3D
@export var player_block: PlayerBlock
@export var patrol_nodes: Array[PatrolNode]

func get_player_pos() -> Vector3:
	return player.global_transform.origin

func get_player_block_pos() -> Vector3:
	return player_block.global_transform.origin

func get_player_block() -> PlayerBlock:
	return self.player_block

func set_player_block_pos(player_pos: Vector3) -> void:
	player_block.set_player_block_pos(player_pos)

func get_patrol_nodes() -> Array[PatrolNode]:
	if patrol_nodes:
		return patrol_nodes
	else:
		print("NO PATROL NODES EXPORTED IN GLOBALCOORDINATOR")
		return []
