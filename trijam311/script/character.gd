extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sword_sound: AudioStreamPlayer2D = $SwordSound

var bounced = false
signal hit_dragon

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite.play("Idle")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if bounced == false :
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			sprite.play("Idle")
			
			
		if direction == -1 and is_on_floor()==true:
			sprite.play("Walk")
			sprite.flip_h = true
		elif direction == 1 and is_on_floor()==true:
			sprite.play("Walk")
			sprite.flip_h = false
		
		
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Node2D":
			hit_dragon.emit()
			sword_sound.play()
		
			$Hit_boss_timer.start()
			bounced = true
			velocity.x = 1 * SPEED
			velocity.y = JUMP_VELOCITY
	
	if bounced== true:
		sprite.play("Attack")
	


func _on_hit_boss_timer_timeout() -> void:
	bounced = false
