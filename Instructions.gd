extends Sprite2D

var active = false

@export_node_path var instructionspath
@onready var animator: AnimationPlayer = get_node(instructionspath)

func _input(event):
	if active and event.is_action_released("ui_accept"):
		active = false
		visible = false
		Mainscript.GameState = 1
		animator.play("TestAnim")
