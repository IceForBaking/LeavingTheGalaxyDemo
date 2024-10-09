extends RigidBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var explotion_audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	animation.play("Idle")

func on_pickup(_body):
	GlobalVars.score += 1
	explotion_audio.play()
	animation.play("Explosion")
	await animation.animation_finished
	
	
	if GlobalVars.score > GlobalVars.hi_score:
		GlobalVars.hi_score = GlobalVars.score
		
	get_tree().queue_delete(self)
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
