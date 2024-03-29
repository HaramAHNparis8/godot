extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1



# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor() :
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity.x = speed * direction
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_top_checker_body_entered(body):
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_layer_bit(4,false)
	$sides_checker.set_collision_mask_bit(0,false)
	$Timer.start(1)
	body.bounce()


func _on_Area2D_body_entered(body):
	body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()


func _on_fall_zone_level_2_body_entered(body):
	pass # Replace with function body.
