class_name ShellSpawn
extends Node2D

@export var scene: Array[PackedScene] = []

func spawn(position: Vector2 = global_position, parent: Node2D = get_tree().current_scene) -> Node2D:
	assert(scene is Array[PackedScene], "Error: The scene export was never set on this spawner component.")
	
	var instance = scene.pick_random().instantiate()
	
	parent.add_child(instance)

	instance.global_position = global_position
	
	return instance
