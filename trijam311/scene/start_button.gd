extends Button

@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn") # Replace with function body.

func _ready() -> void:
	audio_stream_player.play()
