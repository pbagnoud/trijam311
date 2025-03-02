extends Node2D

@export var joueur: Node2D
<<<<<<< Updated upstream

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
=======
@export var Animated_boss: AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Calculer la distance entre l'AnimatedSprite et le joueur
	var distance = global_position.distance_to(joueur.global_position)
	
	# Changer l'animation en fonction de la distance
	if distance < 200:
		Animated_boss.boss_carapace
	else:
		Animated_boss.boss_standard
>>>>>>> Stashed changes
