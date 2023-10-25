extends KinematicBody


export var speed: float = 8
export var jump_velocity: float = 20
var line: int = 0
var velocity: Vector3 = Vector3.ZERO
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	
	# Mouvements du joueur : droit, gauche, saut, roulade
	velocity.y -= gravity * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	velocity = move_and_slide(velocity, Vector3.UP)
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_pressed("ui_down"):
		pass
