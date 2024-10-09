extends Node

@onready var pause_menu = $"../CanvasLayer/Pause menu"
var game_paused: bool = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
		
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	
	else:
		get_tree().paused = false
		pause_menu.hide()
		
func _on_resume_pressed() -> void:
	game_paused = !game_paused

func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
	
func _on_exit_pressed() -> void:
	get_tree().quit()
