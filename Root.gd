extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var index = 0
var studio_label = "Viking Pandas Studio"
export var version_label = "0.0.1"
export var rotation = 0.1

var loader
var wait_frames
var time_max = 100
var current_scene

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1 )
	
	set_process_input(true)
	# Playing music 
	get_node("MenuStreamPlayer").play()
	
	OS.set_window_title("Story of Jorik")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	get_node("round_rune").rotation = get_node("round_rune").rotation + rotation * delta
	get_node("round_two").rotation = get_node("round_two").rotation - rotation * delta
	get_node("Version").text = "V " + version_label
	get_node("StdLabel").text = studio_label
#	pass

func _input(event):
	if Input.is_key_pressed(KEY_UP):
		if(index != 0):
			index -= 1
			var x = get_node("selector").position.x
			var y = get_node("selector").position.y - 90
			get_node("selector").position = Vector2(x,y)
	if Input.is_key_pressed(KEY_DOWN):
		if(index != 3):
			index += 1
			var x = get_node("selector").position.x
			var y = get_node("selector").position.y + 90
			get_node("selector").position = Vector2(x,y)
	if Input.is_key_pressed(KEY_ENTER):
		if (index == 0):
			print("New Game")
			get_tree().change_scene("res://Intro.tscn")
			# goto_scene("res://Cinema_Root.tscn")
		if (index == 1):
			print("Settings")	
		if (index == 2):
			print("Credits")
		if(index == 3):
			get_tree().quit()


#### FADING

#func goto_scene(path):
#	loader = ResourceLoader.load_interactive(path)
#	if loader == null:
#		show_error()
#		return
#	set_process(true)
#
#	current_scene.queue_free()
#
#	# get_node("round_two").play('animate')
#
#	wait_frames = 1
#
#func _process(time):
#	if loader == null:
#		set_process(false)
#		return
#
#	if wait_frames > 0:
#		wait_frames -= 1
#		return 
#
#	var t = OS.get_ticks_msec()
#	while OS.get_ticks_msec() < t + time_max:
#		var err = loader.poll()
#
#		if err == ERR_FILE_EOF: # load finished
#            var resource = loader.get_resource()
#            loader = null
#            set_new_scene(resource)
#            break
#		elif err == OK:
#            update_progress()
#		else: # error during loading
#            show_error()
#            loader = null
#            break
#
#func update_progress():
#    var progress = float(loader.get_stage()) / loader.get_stage_count()
#    # update your progress bar?
#    get_node("progress").set_progress(progress)
#
#    # or update a progress animation?
#    var length = get_node("animation").get_current_animation_length()
#
#    # call this on a paused animation. use "true" as the second parameter to force the animation to update
#    get_node("animation").seek(progress * length, true)

#func set_new_scene(scene_resource):
#    current_scene = scene_resource.instance()
#    get_node("/root").add_child(current_scene)
	
	