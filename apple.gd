extends Area2D

signal appele_collected

func _on_apple_body_entered(body):
	$AnimationPlayer.play("bounce")
	emit_signal("appele_collected")
	#set_collision_mask_bit(0,false)
	

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


