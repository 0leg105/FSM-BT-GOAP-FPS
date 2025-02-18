extends Component
class_name MoveComponent

@onready var nav_agent_3d: NavigationAgent3D = $Node3D/NavigationAgent3D
const SPEED: float = 4
	
func go_to_position(pos: Vector3) -> void:
	var current_location = character_body.global_transform.origin
	nav_agent_3d.set_target_position(pos)
	var next_position = nav_agent_3d.get_next_path_position()
	var new_velocity = (next_position - current_location).normalized() * SPEED
	character_body.velocity = new_velocity
	character_body.move_and_slide()

func get_path_length(pos: Vector3) -> float:
	nav_agent_3d.set_target_position(pos)
	nav_agent_3d.get_next_path_position()
	var path = nav_agent_3d.get_current_navigation_path()
	var total_path_length: float = 0
	for i in range(1, path.size()-1):
		total_path_length += path[i].distance_to(path[i+1])
	return total_path_length

# Für GOAP benötigt
func arrived_at_node() -> void:
	var player_block_component: PlayerBlockComponent = $"../PlayerBlockComponent"
	var patrol_component: PatrolComponent = $"../PatrolComponent"
	var cover_component: CoverComponent = $"../CoverComponent"
	var goap_planner: GoapPlanner = $"../GOAP Planner"
	var goal_name: String = goap_planner.get_current_goal().get_goal_name()
	match goal_name:
		"SearchEnemy":
			player_block_component.set_player_block_visited(true)
		"Patrol":
			patrol_component.set_patrol_node_entered(true)
		"KillEnemy":
			cover_component.cover_node_entered()
