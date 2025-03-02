extends RichTextLabel

func _ready():
	var font = get_font("normal_font")
	font.size = 24  # Définir la taille de la police
	set_font("normal_font", font)
