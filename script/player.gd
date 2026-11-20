extends CharacterBody3D

const  SPEED = 5.0
const TURN_SPEED = 0.05
var direction_2D : Vector2
var direction_3D : Vector3

func _physics_process(delta: float): 
	direction_2D = Input.get_vector(
	"move_left",
	"move_right",
	"move_forward",
	"move_backward"
	)
	direction_3D = transform.basis * Vector3(0, 0, direction_2D.y)
	velocity = SPEED * direction_3D.normalized()
	if direction_2D.x < 0:
		self.rotate_y(TURN_SPEED)
	if direction_2D.x > 0:
		self.rotate_y(-TURN_SPEED)
	move_and_slide()
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.5
		$Camera3D.rotation_degrees.x -= event.relative.y * 0.2
		$Camera3D.rotation_degrees.x = clamp(
		$Camera3D.rotation_degrees.x, -80.0, 80.0
		)
