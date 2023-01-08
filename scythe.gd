extends Line2D

signal scythed

@export_node_path(CollisionShape2D) var collider_path
@onready var collider = get_node(collider_path)

var scything = false

func line_position(id: int, pos: Vector2):
	set_point_position(id, pos)
	var my_shape = collider.shape
	if id == 0:
		my_shape.a = pos
	else:
		my_shape.b = pos
	collider.shape = my_shape

func _input(event):
	if Mainscript.GameState == 1:
		if event is InputEventMouseButton:
			if event.button_index == 1:
				if event.pressed:
					scything = true
					line_position(0, event.position)
					line_position(1, event.position)
				else:
					emit_signal("scythed")
					scything = false
					line_position(0, Vector2(-20, -20))
					line_position(1, Vector2(-20, -20))
		elif event is InputEventMouseMotion:
			if scything:
				line_position(1, event.position)
