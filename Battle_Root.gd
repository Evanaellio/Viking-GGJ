extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var Minion

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	

func _on_TimerSpawn_timeout():
	if randi()%2 == 0:
		print("new one")
		# Choose a random location on Path2D.
		$MinionPath/MinionSpawnLocation.set_offset(1)
		# Create a Mob instance and add it to the scene.
		var minion = Minion.instance()
		add_child(minion)
		# Set the mob's direction perpendicular to the path direction.
		#var direction = $MinionPath/MinionSpawnLocation.rotation + PI / 2
		# Set the mob's position to a random location.
		minion.position = $Player.position
		minion.position.x += 1000
		