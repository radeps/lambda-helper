extends PanelContainer


func _can_drop_data(_at_position, _data):
	return true;
	
func _drop_data(at_position, data):
	data.get_parent().remove_child(data)
