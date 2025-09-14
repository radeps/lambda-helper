class_name LatexReplacingLineEdit extends LineEdit

static var REPLACEMENTS = {
	"\\lambda" : 'λ',
	"\\in" : '∈',
	"\\pi" : 'Π',
	"\\notin" : '∉',
	"\\to" : '→',
	"\\implies" : '⇒',
	"\\forall" : '∀',
	"\\emptyset" : '∅',
	"\\ast" : '∗',
	"\\bot" : '⟘',
	"\\top" : '⟙',
	"\\derive" : '⊢',
	"\\box" : '☐',
	}

func _ready():
	text_changed.connect(_on_text_changed)

func _on_text_changed(_new_text):
	var old_caret = caret_column
	for repl in REPLACEMENTS.keys():
		text = text.replace(repl, REPLACEMENTS[repl])
	if old_caret > len(text):
		old_caret = len(text)
	caret_column = old_caret
