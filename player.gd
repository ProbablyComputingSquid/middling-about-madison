extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -750.0

var crouched = false


func uncrouch():
	crouched = false
	$BentOver.visible = false
	$Standing.visible = true
	$Standing_Hitbox.disabled = false
	$Bent_Hitbox.disabled = true
func crouch():
	crouched = true
	$BentOver.visible = true
	$Standing.visible = false
	$Standing_Hitbox.disabled = true
	$Bent_Hitbox.disabled = false
func _ready():
	uncrouch()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("crouch"):
		crouch()
	if Input.is_action_just_released("crouch"):
		uncrouch()
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		if crouched:
			$BentOver.flip_h = direction < 0
		else:
			$Standing.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
