extends Area2D

@onready var boss_animation = $AnimatedSprite2D

func body_entered(body: Node2D):
	boss_animation.frame = 1
	
func body_exited(body: Node2D):
	boss_animation.frame = 0
