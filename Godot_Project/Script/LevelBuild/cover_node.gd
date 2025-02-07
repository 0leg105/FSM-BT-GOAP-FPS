extends Area3D
class_name CoverNode

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var ray_cast: RayCast3D = $RayCast3D
@onready var contains_npc: bool = false
var player_visible: bool = false
var player_visible_from_cover: bool = false
var cover_component: CoverComponent

func _ready() -> void:
	# Klone das Standardmaterial, sodass jede Instanz ihr eigenes Material hat
	var original_material = mesh.get_surface_override_material(0) # Hole das originale Material
	var new_material = original_material.duplicate() # Dupliziere das Material
	mesh.set_surface_override_material(0, new_material) # Setze das neue Material
	
func _process(_delta: float) -> void:
	var material = self.mesh.get_surface_override_material(0) # Hole das einzigartige Material
	if !player_visible and player_visible_from_cover:
		material.albedo_color = Color(0, 1, 0) # Grün, wenn Cover nicht sichtbar ist
	else:
		material.albedo_color = Color(1, 0, 0) # Rot, wenn Cover sichtbar ist

func set_is_subscribed(cover_component: CoverComponent) -> bool:
	if self.cover_component == null:
		self.cover_component = cover_component
	return self.cover_component != null

func set_player_visible(player_visible: bool, player_pos: Vector3 = Vector3.ZERO) -> void:
	self.player_visible = player_visible
	if not player_visible:
		set_player_visible_from_cover(player_pos)
	if self.player_visible == true and cover_component != null:
		self.cover_component.cover_node_not_valid()
		self.cover_component = null

func is_valid() -> bool:
	return player_visible_from_cover == true and player_visible == false and cover_component == null

func is_valid_cover() -> bool:
	return player_visible_from_cover == true and player_visible == false 

# Wird von Player CoverVisionComponent aufgerufen
func set_player_visible_from_cover(player_pos: Vector3) -> void:
	ray_cast.force_raycast_update()
	ray_cast.look_at(Vector3(player_pos.x, 1.5, player_pos.z), Vector3.UP)
	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()
		if collider.is_in_group("Player"):
			player_visible_from_cover = true
		else:
			player_visible_from_cover = false
	else:
		player_visible_from_cover = false

func is_cover_node_entered() -> bool:
	return self.contains_npc

func set_contains_npc(contains_npc: bool) -> void:
	self.contains_npc = contains_npc

func set_global_coordinator(global_coordinator: GlobalCoordinator) -> void:
	self.global_coordinator = global_coordinator

func get_pos() -> Vector3:
	return global_transform.origin
