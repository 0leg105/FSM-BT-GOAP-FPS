extends State
class_name PlayerMove

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@onready var head = $"..".head

func enter():
	pass
	
func exit():
	pass

func update(delta:float):
	if not character_body.is_on_floor():
		character_body.velocity += character_body.get_gravity() * delta
	
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		character_body.velocity.x = direction.x * SPEED
		character_body.velocity.z = direction.z * SPEED
	else:
		character_body.velocity.x = 0
		character_body.velocity.z = 0
		fsm.change_state(self,"Idle")
	character_body.move_and_slide()
