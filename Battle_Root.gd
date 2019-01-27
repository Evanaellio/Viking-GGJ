extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var Minion
var screensize

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	screensize = get_viewport_rect().size

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	

func _on_TimerSpawn_timeout():
	if randi()%2 == 0 and $boss.position.x - $Player.position.x > screensize.x:
		# Choose a random location on Path2D.
		#$MinionPath/MinionSpawnLocation.set_offset(1)
		# Create a Mob instance and add it to the scene.
		var minion = Minion.instance()
		add_child(minion)
		if (!minion.is_connected('attack_the_player', $Player, '_on_minion_attack')):
			minion.connect('attack_the_player', $Player,'_on_minion_attack')
		# Set the mob's direction perpendicular to the path direction.
		#var direction = $MinionPath/MinionSpawnLocation.rotation + PI / 2
		# Set the mob's position to a random location.
		minion.position = $Player.position
		minion.position.x += screensize.x
		

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
