extends CharacterBody3D
class_name Npc

@export var label_info: LabelInfo
var spawn: NpcSpawner
var patrol_nodes: Array[PatrolNode]
var global_coordinator: GlobalCoordinator
var cover_node_manager: CoverNodeManager
var state_manager: StateManager
var move_component: MoveComponent
var player_block_component: PlayerBlockComponent
var vision_component: VisionComponent
var patrol_component: PatrolComponent
var look_at_component: LookAtComponent
var health_component: HealthComponent
var cover_component: CoverComponent

func _enter_tree() -> void:
	spawn = get_parent()
	global_coordinator = get_tree().get_first_node_in_group("global_coordinator")
	patrol_nodes = global_coordinator.get_patrol_nodes()
	cover_node_manager = get_tree().get_first_node_in_group("cover_node_manager")
	state_manager = $StateManager
	vision_component = $VisionComponent
	patrol_component = $PatrolComponent
	look_at_component = $LookAtComponent
	player_block_component = $PlayerBlockComponent
	health_component = $HealthComponent
	move_component = $MoveComponent
	cover_component = $CoverComponent
	# player_block signal connection
	#global_coordinator.get_player_block().append_npc(self)
	global_coordinator.get_player_block().set_new_player_block.connect(_on_player_block_set_new_player_block)

func _exit_tree() -> void:
	spawn.decrement(1)

func get_global_coordinator() -> GlobalCoordinator:
	return global_coordinator

func get_cover_node_manager() -> CoverNodeManager:
	return cover_node_manager

func get_state_manager() -> StateManager:
	return state_manager

func get_patrol_nodes() -> Array[PatrolNode]:
	return patrol_nodes

func get_player_block() -> PlayerBlock:
	return global_coordinator.get_player_block()

func get_health_component() -> HealthComponent:
	return health_component

func get_move_component() -> MoveComponent:
	return move_component

func get_player_block_component() -> PlayerBlockComponent:
	return player_block_component

func get_patrol_component() -> PatrolComponent:
	return patrol_component

func get_cover_component() -> CoverComponent:
	return cover_component

func get_label_info() -> LabelInfo:
	return label_info

func get_look_at_component() -> LookAtComponent:
	return look_at_component

# Signal von PlayerBlock
func _on_player_block_set_new_player_block() -> void:
	player_block_component.set_player_block_visited(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("label_toggle"):
		label_info.visible = !label_info.visible

func set_global_coordinator(global_coordinator: GlobalCoordinator) -> void:
	self.global_coordinator = global_coordinator
