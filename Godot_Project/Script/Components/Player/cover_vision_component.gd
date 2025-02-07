extends Area3D

@onready var visionRayCast = $RayCast3D

func _on_timer_timeout() -> void:
	var areas = self.get_overlapping_areas()
	if areas.size() > 0:
		for area in areas:
			if area.is_in_group("CoverNode"):
				var areaPos = area.global_transform.origin
				visionRayCast.look_at(areaPos, Vector3.UP)
				visionRayCast.force_raycast_update()
				if visionRayCast.is_colliding():
					var collider = visionRayCast.get_collider()
					#print(area, " ",collider.is_in_group("CoverNode"), " ", collider)
					if collider.is_in_group("CoverNode"):
						area.set_player_visible(true)
						visionRayCast.debug_shape_custom_color = Color(1,0,0) #Rot
					else:
						area.set_player_visible(false, self.global_transform.origin)
						visionRayCast.debug_shape_custom_color = Color(0,1,0) #Grün

func _on_area_exited(area: Area3D) -> void:
	if area.is_in_group("CoverNode"):
		# true: Cover ist außerhalb der Reichweite und soll somit nicht beachtet werden
		area.set_player_visible(true)
