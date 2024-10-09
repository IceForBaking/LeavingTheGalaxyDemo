extends Area2D

@export var speed = 150
@export var sheel_speed = 50

@onready var shell_1: Marker2D = $Shell1
@onready var shell_2: Marker2D = $Shell2
@onready var shell_3: Marker2D = $Shell3
@onready var shell_4: Marker2D = $Shell4
@onready var shell_5: Marker2D = $Shell5
@onready var shell_6: Marker2D = $Shell6
@onready var shell_spawn: Node2D = $ShellSpawn
@onready var shell_timer: Timer = $ShellTimer

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_animation: AnimatedSprite2D = $AnimatedSprite2D/AnimatedSprite2D

func _ready() -> void:
	engine_animation.play("engine")
	shell_timer.timeout.connect(fire_lasers)

func _process(delta: float) -> void:
	global_position.y += speed * delta
	
func fire_lasers() -> void:
	shell_spawn.spawn(shell_1.global_position)
	shell_spawn.spawn(shell_2.global_position)
	shell_spawn.spawn(shell_3.global_position)
	shell_spawn.spawn(shell_4.global_position)
	shell_spawn.spawn(shell_5.global_position)
	shell_spawn.spawn(shell_6.global_position)
	
func die():
	animation.play("Die")
	await animation.animation_finished
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die() 	
		die()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
