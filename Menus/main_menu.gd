extends CanvasLayer

var SCROLL_SPEED_H := 100

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func _on_start_game_pressed() -> void:
	GlobalVars.score = 0
	if not GlobalVars.hi_score:
		GlobalVars.hi_score = 0
	get_tree().change_scene_to_file("res://Scenes/start_world.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_hi_scores_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/hall_of_fame.tscn")
	
func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset.x += SCROLL_SPEED_H * delta


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/options_menu.tscn")
