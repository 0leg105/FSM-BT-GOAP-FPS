extends Node3D
class_name NpcSpawner

@export var max_npc_count: int
@export var wait_time: float = 2
@export var npc: PackedScene
var npcs: Array[Npc] = []
var timer: Timer
var current_npc_count: int = 0

func _process(delta: float) -> void:
	for npc in npcs:
		npc.update(delta)

func _enter_tree() -> void:
	if not npc:
		push_error("NO NPC EXPORT IN NPCSPAWNER")
	timer = $Timer
	timer.wait_time = self.wait_time
	timer.autostart = true
	timer.one_shot = false
	timer.start()

func spawn_npc() -> void:
	var instance = npc.instantiate()
	add_child(instance)
	npcs.append(instance)

func set_max_npc_count(max_npc_count: int) -> void:
	self.max_npc_count = max_npc_count

func decrement(value: int) -> void:
	current_npc_count -= value

func _on_timer_timeout() -> void:
	if current_npc_count < max_npc_count:
		spawn_npc()
		current_npc_count += 1

func get_current_npc_count() -> int:
	return current_npc_count
