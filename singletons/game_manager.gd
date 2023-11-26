extends Node

signal on_game_over
signal on_score_updated

const GROUP_PLANE: String = "plane"
#const SCROLL_SPEED: float = 120.0
var difficulty: float = 1
var scroll_speed: float = 120

var game_scene: PackedScene = preload("res://game.tscn")
var main_scene: PackedScene = preload("res://Main/main.tscn")


func get_difficulty() -> float:
	return difficulty

func increase_difficulty() -> void:
	difficulty += 0.1
	print ("new difficulty: %s" % difficulty)

func reset_difficulty() -> void:
	difficulty = 1

func get_scroll_speed() -> float:
	return scroll_speed * difficulty

var score: int = 0

var high_score: int = 0

func get_score() -> int:
	return score
	
func get_high_score() -> int:
	return score

func set_score(v: int) -> void:
	score = v
	if score > high_score:
		high_score = score
	on_score_updated.emit()
	
func increment_score() -> void:
	set_score(score+1)

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)
	
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
	
