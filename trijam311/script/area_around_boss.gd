extends Area2D

@onready var boss_animation = $AnimatedSprite2D
signal change_into_carapace
signal change_into_standard

func _ready():
	boss_animation.frame = 0

func body_entered(body: Node2D):
	if body.is_in_group('Player'):
		boss_animation.frame = 1
		emit_signal("change_into_carapace")
	
func body_exited(body: Node2D):
	boss_animation.frame = 0
	emit_signal("change_into_standard")
