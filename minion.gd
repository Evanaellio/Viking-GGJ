extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed
export (int) var life
export (bool) var isBoss

func _ready():
	set_process(true)
	if isBoss:
		speed = 0
		life = 100
	
func _process(delta):
	
	var move = Vector2()
	
	move += Vector2(-1,0)
	
	move = move.normalized() * speed
	move_and_slide(move)

func _on_Player_attack():
	if isBoss:
		speed = 100
	take_damage()
	
func take_damage():
	print(life)
	life -= 5
	if life <= 0:
		if isBoss:
			get_tree().change_scene("res://Outro.tscn")
		queue_free()
	
func fallback():
	var move = Vector2()
	move += Vector2(1,0)
	move = move.normalized() * speed
	move_and_slide(move)
