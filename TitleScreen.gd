extends Sprite2D

var active = true

@export_node_path var instructionspath
@onready var instructions = get_node(instructionspath)

func _input(event):
	if active and event.is_action_released("ui_accept"):
		instructions.visible = true
		instructions.active = true
		active = false
		visible = false
		
