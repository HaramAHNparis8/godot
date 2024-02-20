extends KinematicBody2D
var velocity = Vector2()
var is_dead = false
export (int) var speed = 100
func _ready():
	pass
func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$coll.disabled = true
	$Timer.start()
func _physics_process(delta):
	if is_dead == false:
		if get_parent().has_node("player"):
			var player = get_parent().get_node("player")
			var direction = (player.position - position).normalized()
			var motion = direction * speed * delta
			position += motion
			look_at(player.position)



func _on_Timer_timeout():
	queue_free()
	get_tree().change_scene("res://Control.tscn")



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://gameover.tscn")
