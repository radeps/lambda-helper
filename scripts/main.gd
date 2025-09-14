extends Control

const CAMERA_SPEED = 5

var num_terms = 1

func _process(delta : float):
	if Input.is_key_pressed(KEY_RIGHT):
		for node in %DropArea.get_children():
			node.position.x -= CAMERA_SPEED
	if Input.is_key_pressed(KEY_LEFT):
		for node in %DropArea.get_children():
			node.position.x += CAMERA_SPEED
	if Input.is_key_pressed(KEY_UP):
		for node in %DropArea.get_children():
			node.position.y += CAMERA_SPEED
	if Input.is_key_pressed(KEY_DOWN):
		for node in %DropArea.get_children():
			node.position.y -= CAMERA_SPEED
	
func _ready():
	%NewTerm.pressed.connect(_on_new_term)
	%NewFlag.pressed.connect(_on_new_flag)
	%NewSequence.pressed.connect(_on_new_sequence)
	%HelpButton.pressed.connect(_on_help_pressed)
	
	fill_replacement_help()

func fill_replacement_help():
	var list = "[ul]"
	for k in LatexReplacingLineEdit.REPLACEMENTS.keys():
		list += (k + " ⇒ " + LatexReplacingLineEdit.REPLACEMENTS[k] + "\n")
	list += "[/ul]"
	%HelpText.append_text(list)

func _on_help_pressed():
	%HelpPanel.visible = %HelpButton.button_pressed

func _on_new_term():
	var term = load("res://scenes/text_node.tscn").instantiate()
	term.set_number(num_terms + 1)
	num_terms += 1
	%DropArea.add_child(term)
	term.position = term.position + Vector2(randi() % 20, randi() % 20)

func _on_new_flag():
	var flag = load("res://scenes/flag_node.tscn").instantiate()
	%DropArea.add_child(flag)
	flag.position = flag.position + Vector2(randi() % 20, randi() % 20)

func _on_new_sequence():
	var seq = load("res://scenes/sequence_node.tscn").instantiate()
	%DropArea.add_child(seq)
	seq.position = seq.position + Vector2(randi() % 20, randi() % 20)
