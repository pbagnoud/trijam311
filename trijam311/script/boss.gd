extends Node2D

signal change_into_carapace
signal change_into_standard
signal hit
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var shake_over: ShakeComponent = $"shake over"
@onready var color_change_2: ColorChange = $ColorChange2
@onready var explosion_particles: CPUParticles2D = $ExplosionParticles
@onready var area_2d: Area2D = $Area2D

func got_hit():
	emit_signal('hit')
	print('emit hit')
	audio_stream_player_2d.play()
func emit_carapace():
	emit_signal("change_into_carapace")
	
func emit_standard():
	emit_signal("change_into_standard")
func remove():
	shake_over.tween_shake()
	color_change_2.color_tween()
	explosion_particles.emitting = true
	area_2d.visible = false
