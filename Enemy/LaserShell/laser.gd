extends Node2D

@export var speed = 100
@export var velocity: Vector2

func _process(delta: float) -> void:
	global_position.x += speed * delta
	translate(velocity * delta)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die() 	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
