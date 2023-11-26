extends CharacterBody2D

@export var GRAVITY: float = 1000.0
@export var POWER: float = -400.0
const FORWARD_POWER: float = 30
@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

var dead: bool = false

func _ready():
	pass
	
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor() == true:
		die()

func die() -> void:
	if dead:
		return
	dead = true
	
	animated_sprite_2d.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("fly")
	if Input.is_action_just_pressed("forward"):
		velocity.x += FORWARD_POWER
	if Input.is_action_just_pressed("backward"):
		velocity.x -= FORWARD_POWER
