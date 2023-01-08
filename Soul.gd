extends Sprite2D

var started = false
var ended = false
var posy = 0
var speed = 30
@onready var initpos = position.y

func start():
	visible = true
	started = true

func _process(delta):
	if started and not ended:
		posy += delta * speed
		position.y = initpos - posy
		if posy >= 25:
			ended = true
			visible = false
