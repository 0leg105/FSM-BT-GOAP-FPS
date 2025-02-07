extends Node3D
class_name AutoMoveComponent

@export var character_body: CharacterBody3D
@onready var nav_agent_3d: NavigationAgent3D = $NavigationAgent3D
const SPEED: float = 3
const ROTATION_SPEED: float = 2

func go_to_position(delta, pos: Vector3) -> void:
	var current_location = character_body.global_transform.origin
	nav_agent_3d.set_target_position(pos)
	var next_position = nav_agent_3d.get_next_path_position()
	var new_velocity = (next_position - current_location).normalized() * SPEED
	
	# Kreisdrehung
	character_body.rotation.y += ROTATION_SPEED * delta
	
	character_body.velocity = new_velocity
	character_body.move_and_slide()
