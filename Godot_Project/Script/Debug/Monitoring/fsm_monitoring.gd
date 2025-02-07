extends Monitoring
class_name FsmMonitoring

func _exit_tree() -> void:
	var timestamp: String = Time.get_datetime_string_from_system().replace(" ", "_").replace(":", "-")
	#save_data(path + timestamp +".json", fps_data)
	#save_data(path + timestamp +".json", mem_data)
