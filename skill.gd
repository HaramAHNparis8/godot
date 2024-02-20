extends Area2D
var direction = 1
const SPEED = 600
var velocity = Vector2()
var HP = 3
var dammage = -1
func _ready():
	pass
	
func set_skill_direction(dir):
	direction = dir
	if dir == -1:
		$skill.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$skill.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_skill_body_entered(body):
	if "boss" in body.name:
		body.dead()

	queue_free()
