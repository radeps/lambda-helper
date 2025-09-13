extends PanelContainer


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return self

func set_number(num : int):
	%Number.text = str(num)
	
