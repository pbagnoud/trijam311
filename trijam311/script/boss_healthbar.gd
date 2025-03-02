extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Boss_Health_Label.text = str(value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func little_damage():
	value += -1
	$Boss_Health_Label.text = str(value)
	
func big_damage():
	value += -100
	$Boss_Health_Label.text = str(value)
	
