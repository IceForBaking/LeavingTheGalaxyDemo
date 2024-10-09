extends Node2D

@export var asteroid_scene: PackedScene
@export var enemy_scenes: Array[PackedScene] = []
@export var big_enemy_scenes: PackedScene
@export var exit_score : int

@onready var main_music: AudioStreamPlayer2D = $MainMusic	
@onready var timer = $EnemySpawn
@onready var enemy_container = $EnemyContainer
@onready var big_enemy_container = $BigEnemyContainer


func _ready() -> void:
	main_music.play()

func _process(_delta: float) -> void:
	visability()

func _on_asteroid_timer_timeout() -> void:
	
	var asteroid = asteroid_scene.instantiate()
	
	var asteroid_spawn_location = get_node("AsteroidPath/AsteroidSpawnLocation")
	asteroid_spawn_location.progress_ratio = randf()
	
	var direction = asteroid_spawn_location.rotation + PI / 2
	
	asteroid.position = asteroid_spawn_location.position
	
	direction += randf_range(-PI / 4, PI / 4)
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	asteroid.linear_velocity = velocity.rotated(direction)	
	add_child(asteroid)
	

func _on_enemy_spawn_timeout() -> void:
	var enemy = enemy_scenes.pick_random().instantiate()
	enemy.global_position = Vector2(randf_range(50,950),-50)
	enemy_container.add_child(enemy)
		
func _on_big_enemy_timer_timeout() -> void:
	var big_enemy = big_enemy_scenes.instantiate()
	big_enemy.global_position = Vector2(randf_range(50,950),-50)
	big_enemy_container.add_child(big_enemy)
	
func visability():
	if GlobalVars.score < exit_score:
		$Exit.hide()
		get_node("Player/PickupArea/CollisionShape2D").disabled = false
		get_node("Exit/CollisionShape2D").disabled = true
	else:
		$Exit.show()
		get_node("Player/PickupArea/CollisionShape2D").disabled = true		
		get_node("Exit/CollisionShape2D").disabled = false
