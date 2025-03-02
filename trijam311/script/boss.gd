extends Node2D

signal change_into_carapace
signal change_into_standard
signal hit

func got_hit():
	emit_signal('hit')
	print('emit hit')
	
func emit_carapace():
	emit_signal("change_into_carapace")
	
func emit_standard():
	emit_signal("change_into_standard")
