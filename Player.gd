extends KinematicBody2D

export var speed = 200

var movedir = Vector2(0,0)
signal attack

func _physics_process(delta):
	controls_loop()
	movement_loop()

func controls_loop():
	var LEFT 	= Input.is_action_pressed('ui_left')
	var RIGHT 	= Input.is_action_pressed('ui_right')
	var SPACE = Input.is_key_pressed(KEY_SPACE)

	movedir.x = -int(LEFT) + int(RIGHT)
	
	if SPACE:
		attack()
	
func movement_loop():
	var motion = movedir.normalized() * speed
	move_and_slide(motion, Vector2(0,0))

func attack():
	var target_col = self.get_slide_collision(0)
	if target_col != null:
		var target_node = target_col.collider
		print(target_node)
		if (!self.is_connected('attack', target_node, '_on_Player_attack')):
			self.connect('attack', target_node,'_on_Player_attack')
		emit_signal('attack')


