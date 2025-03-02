extends Button


# Called when the node enters the scene tree for the first time.
@onready var rich_text_label: RichTextLabel = $RichTextLabel


func _on_pressed() -> void:
	rich_text_label.text = '[center]Thanks for playing!'
