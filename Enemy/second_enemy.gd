extends Area2D

@export var speed = 150

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_animation: AnimatedSprite2D = $AnimatedSprite2D/AnimatedSprite2D

func _ready() -> void:
	engine_animation.play("Engine")

func _process(delta: float) -> void:
	global_position.y += speed * delta
	
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
