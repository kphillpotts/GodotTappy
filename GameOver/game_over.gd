extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var can_press_space: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_press_space:
		if Input.is_action_just_pressed("fly"):
			GameManager.load_game_scene()

func _on_timer_timeout():
	run_sequence()

func run_sequence() -> void:
	game_over_label.hide()
	press_space_label.show()
	can_press_space = true

func on_game_over() -> void:
	show()
	timer.start()