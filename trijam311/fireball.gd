extends Node2D

@onready var fireball_img: Sprite2D = $FireballImg

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewport_width = get_viewport().size.x
	var spawn_width = randf_range(0, viewport_width)
	position.x = spawn_width
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = 100
	position.y = position.y + speed*delta
	

func flip():
	fireball_img.flip_v = not fireball_img.flip_v
