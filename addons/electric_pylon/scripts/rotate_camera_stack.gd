extends Node3D

@export var rotation_rate_dps : float = 0.0
var rotation_rate_rps : float

# Called when the node enters the scene tree for the first time.
func _ready():
	if abs(rotation_rate_dps) < 1e-6:
		set_process(false)
		#set_physics_process(false)
	else:
		rotation_rate_rps = rotation_rate_dps * 0.01745329252


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print (get_parent_node_3d().transform.basis.y)
	rotate_y(rotation_rate_rps * delta)
	transform = transform.orthonormalized()
