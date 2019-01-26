extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 4
var life = 10

func _ready():
	set_process(true)
	
func _process(delta):
	
	var move = Vector2()
	
	move += Vector2(-1,0)
	
	move = move.normalized() * speed
	move_and_slide(move)

func _on_Player_attack():
	take_damage()
	
func take_damage():
	print('Signal receive..')
	life -= 5
	if life <= 0:
		fallback()
	
func fallback():
	var move = Vector2()
	move += Vector2(1,0)
	move = move.normalized() * speed
	move_and_slide(move)
