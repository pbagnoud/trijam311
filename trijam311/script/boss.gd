extends Node2D

signal change_into_carapace
signal change_into_standard

func emit_carapace():
	emit_signal("change_into_carapace")
	
func emit_standard():
	emit_signal("change_into_standard")
