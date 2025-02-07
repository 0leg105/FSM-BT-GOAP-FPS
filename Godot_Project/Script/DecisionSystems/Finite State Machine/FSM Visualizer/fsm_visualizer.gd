extends Node2D
class_name FSMVisualizer

var states: Array

#func _ready() -> void:
	#print(states)
	#self.states = get_tree().get_nodes_in_group("StateCircle")
#
#func _draw() -> void:
	#for state in states:
		#draw_transition_line(state)
#
#func draw_transition_line(state) -> void:
	#var transitions = state.get_transitions()
	#for transition in transitions:
		#if transition != null:
			#draw_arrow(state.global_transform.position, transition.global_transform.position)
#
#func draw_arrow(start_pos: Vector2, end_pos: Vector2) -> void:
	## Berechne die Richtung und den Abstand zwischen den Punkten
	#var direction = (end_pos - start_pos).normalized()
	#print(end_pos, " ", start_pos)
	#print(direction)
	#var arrow_size = 20  # Größe des Pfeilkopfs
#
	## Zeichne die Linie (Schaft des Pfeils)
	#draw_line(start_pos, end_pos, Color(1, 0, 0), 2)
#
	## Berechne die Richtungen für den Pfeilkopf
	#var right = direction.rotated(deg_to_rad(45)) * arrow_size
	#var left = direction.rotated(deg_to_rad(-45)) * arrow_size
#
	## Zeichne die Pfeilspitze (ein V-förmiges Ende)
	#draw_line(end_pos, end_pos + right, Color(1, 0, 0), 2)
	#draw_line(end_pos, end_pos + left, Color(1, 0, 0), 2)
	#draw_line(end_pos + right, end_pos + left, Color(1, 0, 0), 2)
