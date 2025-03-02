extends ProgressBar
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
signal over
var is_over = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Boss_Health_Label.text = str(value)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_over:
		print('over')
		return
	if value <0:
		is_over = true
		game_over()
	
func check_value(value):
	if value < 1:
		game_over()
		
func game_over():
	audio_stream_player.play()
	emit_signal('over')

func return_menu():
	get_tree().change_scene_to_file("res://scene/start_and_quit.tscn")
	
func little_damage():
	value += -1
	$Boss_Health_Label.text = str(value)
	if value < 0:
		print('go')
		game_over()
	
func big_damage():
	value += -400
	$Boss_Health_Label.text = str(value)
	if value < 0:
		print('go')
		game_over()
	
