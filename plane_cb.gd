extends CharacterBody2D

const GRAVITY: float = 1000.0
const POWER: float = -400.0
@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	pass
	
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor() == true:
		die()

func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("fly")
