extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var alpha_name = "Jorik"
export var beta_name = ""

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var alpha_name_lb = get_node("dialog_panel_alpha/alpha_name_label")
	var beta_name_lb = get_node("dialog_panel_beta/beta_name_label")
	
	alpha_name_lb.text = alpha_name
	beta_name_lb.text = beta_name
	
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
