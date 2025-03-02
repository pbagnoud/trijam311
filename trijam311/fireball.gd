extends Node2D

signal boss_is_hit_by_fireball

@onready var fireball_img: Sprite2D = $FireballImg
@onready var fireball_explosion_area: Area2D = $FireballExplosionArea
@onready var explosion_particles: CPUParticles2D = $ExplosionParticles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewport_width = get_viewport().size.x
	var spawn_width = randf_range(64, int(viewport_width/3))
	position.x = spawn_width
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = 150
	position.y = position.y + speed*delta
	
func flip():
	fireball_img.flip_h = not fireball_img.flip_h

func exits_screen():
	queue_free()

func meets_player(player):
	if player.is_in_group("Player"):
		var bodies_in_area = fireball_explosion_area.get_overlapping_bodies()
		player.got_hit()
		for body in bodies_in_area:
			if body.is_in_group('boss'):
				boss_is_hit_by_fireball.emit()
		fireball_img.visible = false
		explosion_particles.emitting = true
	else:
		pass
	
