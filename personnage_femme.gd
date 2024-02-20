extends KinematicBody2D
var velocity = Vector2(0,0)
var apple = 0
const SPEED = 180
const gravity = 80
const jumpforce = -900
const SKILL = preload("res://skill.tscn")

var portal_id = 0

var is_attack = false

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		if is_attack == false:
			velocity.x = SPEED
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			$AudioStreamPlayer.play()
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("left"):
		if is_attack == false:
			velocity.x = -SPEED
			$AnimatedSprite.play("run")
			$AudioStreamPlayer.play()
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
	else:
		$AnimatedSprite.play("idle")
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		
	velocity.y = velocity.y + gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
		$AnimatedSprite.play("jump")
	if Input.is_action_just_pressed("skill") && is_attack == false:
		is_attack = true
		$AnimatedSprite.play("skill")
		var skill = SKILL.instance()
		if sign($Position2D.position.x) == 1:
			skill.set_skill_direction(1)
		else:
			skill.set_skill_direction(-1)
		get_parent().add_child(skill)
		skill.position = $Position2D.global_position
		
		
		
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	#if apple == 32:
		#get_tree().change_scene("res://Node2D.tscn")#go to next level
	
	


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Node2D.tscn")#fallzone
	
	
	
func bounce():
	velocity.y = jumpforce * 0.7
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = jumpforce * 0.5
	get_tree().change_scene("res://gameover.tscn")
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()




func _on_fall_zone_level_2_body_entered(body):
	get_tree().change_scene("res://level2.tscn")


func _on_AnimatedSprite_animation_finished():
	is_attack = false
