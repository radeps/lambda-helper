extends PanelContainer

func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return self

func _ready():
	%AddTerm.pressed.connect(_on_add_term)
	%RemoveTerm.pressed.connect(_on_remove_term)

func _on_add_term():
	var new_area = load("res://drop_area.tscn").instantiate()
	$VBoxContainer.add_child(new_area)

func _on_remove_term():
	var idx = $VBoxContainer.get_child_count() - 1
	$VBoxContainer.remove_child($VBoxContainer.get_child(idx))
