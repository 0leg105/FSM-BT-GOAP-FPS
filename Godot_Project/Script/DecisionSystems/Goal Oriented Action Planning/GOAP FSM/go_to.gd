extends State
class_name Goto
# Animiert das Gehen in eine Richtung und realisiert das Movement in eine Position

var go_to_node_action: GoToNode
var move_component: MoveComponent
var target_position: Vector3
const TOLERANCE: float = 1.2

func _enter_tree() -> void:
	super._enter_tree()
	character_body = $"../.."
	go_to_node_action = $"../../GOAP Planner/Actions/GoToNode"
	move_component = character_body.get_move_component()

func update(_delta:float):
	target_position = state_manager.get_state("next_pos")
	# Sollte GoTo Action nicht möglich sein, so soll ein neuer Plan erstellt werden
	if not go_to_node_action.is_valid():
		character_body.set_create_plan(true)
		return
	if character_body.global_transform.origin.distance_to(target_position) >= TOLERANCE:
		move_component.go_to_position(target_position)
	else:
		move_component.arrived_at_node()
		fsm.change_state(self,"Action")
