extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed
export (int) var life
export (int) var range_atk
export (int) var puissance
export (bool) var isBoss

signal attack_the_player

func _ready():
	set_process(true)
	if isBoss:
		speed = 0
		life = 1000
	
func _process(delta):
	var move = Vector2()
	
	move += Vector2(-1,0)
	
	move = move.normalized() * speed
	move_and_slide(move)
	attack()

func _on_Player_attack():
	if isBoss:
		speed = 100
	take_damage()
	
func take_damage():
	print(life)
	life -= 1
	if life <= 0:
		if isBoss:
			life = 1000
		else:
			queue_free()
	
func fallback():
	var move = Vector2()
	move += Vector2(1,0)
	move = move.normalized() * speed
	move_and_slide(move)

func attack():
	if self.get_slide_count() == 1:
		var target_col = self.get_slide_collision(0)
		var target_node = target_col.collider
		if target_node.position.x - self.position.x < range_atk:
			print(target_node)
			emit_signal('attack_the_player', puissance)
		