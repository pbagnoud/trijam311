extends Node2D
@onready var boss_healthbar: ProgressBar = $BossHealthbar
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var please_spawn_fireballs = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play() # Replace with function body.

func fade_out():
	var tween = create_tween()
	tween.tween_property(audio_stream_player,'volume_db',-25,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_fireballs_true():
	please_spawn_fireballs = true
	print('spawn true')

func spawn_fireballs_false():
	please_spawn_fireballs = false
	print('spawn flase')
	
func spawn_fireballs():
	if please_spawn_fireballs == true:
		const FIREBALL = preload("res://scene/fireball.tscn")
		var fireball = FIREBALL.instantiate()
		add_child(fireball)
		fireball.boss_is_hit_by_fireball.connect(boss_healthbar.big_damage)
	else:
		pass
