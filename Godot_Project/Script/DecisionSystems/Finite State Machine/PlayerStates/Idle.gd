extends State
class_name PlayerIdle

@export var move_component: AutoMoveComponent
@export var auto_component: AutoGoComponent
const TOLERANCE: float = 1.2

func update(delta:float):
	#var target_position: Vector3 = auto_component.get_patrol_node_pos()
	#if character_body.global_transform.origin.distance_to(target_position) > TOLERANCE:
		#move_component.go_to_position(delta, target_position)
	#else:
		#auto_component.set_node_entered(true)
		
	if Input.get_vector("left", "right", "up", "down"):
		fsm.change_state(self, "Move")
