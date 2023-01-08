extends ColorRect

@export_node_path var labelpath
@onready var label: Label = get_node(labelpath)
@export_node_path var animpath
@onready var animator: AnimationPlayer = get_node(animpath)

func activate():
	Mainscript.GameState = 2
	visible = true
	animator.stop()
	label.text = "Score: " + str(int(round(Mainscript.score)))
