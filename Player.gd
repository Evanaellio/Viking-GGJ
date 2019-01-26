extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed
var screensize
var can_move_right
signal hit

func _ready():
	screensize = get_viewport_rect().size
	# Called when the node is added to the scene for the first time.
	# Initialization here
	can_move_right = true
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _process(delta):
	var velocity = Vector2()
	velocity.y += 0.5
	if Input.is_key_pressed(KEY_D) and can_move_right:
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_key_pressed(KEY_Q):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_key_pressed(KEY_SPACE):
		$AnimatedSprite.animation = "prepare_attack"
	elif $AnimatedSprite.animation == "prepare_attack":
		$AnimatedSprite.animation = "attack"
	elif $AnimatedSprite.animation == "attack":
		$AnimatedSprite.animation = "normal"
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if velocity.x != 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 10, screensize.y/2)
	

func _on_Player_area_entered(area):
	can_move_right = false

func _on_Player_area_exited(area):
	can_move_right = true
