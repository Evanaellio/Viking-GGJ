extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed
var screensize

func _ready():
	screensize = get_viewport_rect().size
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _process(delta):
	var velocity = Vector2()
	velocity.y += 0.5
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
        velocity.y += 1
	if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if velocity.x > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 10, screensize.y/2)
		