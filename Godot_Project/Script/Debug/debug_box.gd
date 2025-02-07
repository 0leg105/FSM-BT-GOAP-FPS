extends Node3D
class_name DebugBox

func set_debug_box_pos(pos: Vector3) -> void:
	self.global_transform.origin = pos
