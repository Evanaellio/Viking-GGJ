extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene("Root.tscn")
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
