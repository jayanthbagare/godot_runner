extends KinematicBody2D

var playerVelocity = Vector2(0.0,0.0)
var jumpForce = 270.0
var jumped = false
var speed = 350

func _physics_process(delta: float) -> void:
	playerVelocity.y += 5.0
	
	if(Input.is_action_pressed("move_right")):
		playerVelocity.x = speed
		get_node("playerSprite").flip_h = false
		get_node("playerSprite").play("run")

	elif(Input.is_action_pressed("move_left")):
		playerVelocity.x = -speed
		get_node("playerSprite").flip_h = true
		get_node("playerSprite").play("run")
		
	else:
		playerVelocity.x = 0.0
		get_node("playerSprite").flip_h = false
		get_node("playerSprite").play("idle")
	
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		playerVelocity = Vector2.UP * jumpForce
		
	if(is_on_floor()):
		if(Input.is_action_just_pressed("jump")):
			playerVelocity = Vector2.UP * jumpForce
			jumped = true

	if(Input.is_action_just_released("attack")):
		get_node("playerSprite").play("attack")
		
	playerVelocity = move_and_slide(playerVelocity,Vector2.UP)
