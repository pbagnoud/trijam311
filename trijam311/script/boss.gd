extends Node2D

signal change_into_carapace
signal change_into_standard
signal hit
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func got_hit():
	emit_signal('hit')
	print('emit hit')
	audio_stream_player_2d.play()
func emit_carapace():
	emit_signal("change_into_carapace")
	
func emit_standard():
	emit_signal("change_into_standard")
