class_name Player extends CharacterBody2D

@export var speed = 400
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var death_sound: AudioStreamPlayer2D = $DeathSound

func _ready() -> void:
	animation.play("rotation")

func get_input():
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.has_method("on_pickup"):
		body.on_pickup(self)
		
func die():
	speed = 0
	death_sound.play()
	animation.play("explotion")
	await animation.animation_finished
	queue_free()
	get_tree().change_scene_to_file("res://Menus/game_over.tscn")
