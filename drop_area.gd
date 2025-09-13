class_name DropArea extends PanelContainer

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var par = data.get_parent()
	par.remove_child(data)
	add_child(data)
	data.position = at_position
	if par.name != "DropArea":
		par.size = Vector2(1,1)
