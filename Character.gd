extends AnimatableBody2D

@export_node_path var scythelinepath
@onready var scytheline = get_node(scythelinepath)

@export_node_path var eye1path
@onready var eye1: Sprite2D = get_node(eye1path)

@export_node_path var eye2path
@onready var eye2: Sprite2D = get_node(eye2path)

@export_node_path var soulpath
@onready var soul = get_node(soulpath)

@export_node_path var deadSpritePath
var deadSprite: Sprite2D
@export_node_path var liveSpritePath
var liveSprite: Sprite2D

@onready var blackEye = preload("res://blackeye.png")
@onready var whiteEye = preload("res://whiteeye.png")
@onready var redEye = preload("res://redeye.png")

var shouldBeDead = false
var isDead = false
var ressurectionTime = false
var hasDeadSprite = false

var score = 10

func check_scythe():
	var scythe_collision = move_and_collide(Vector2(0,0), true)                        
	if scythe_collision:
		if shouldBeDead and not isDead and not ressurectionTime:
			reap_soul()
		elif not isDead and not ressurectionTime:
			early_death()

func _ready():
	sync_to_physics = false
	scytheline.connect("scythed", check_scythe)
	if deadSpritePath:
		hasDeadSprite = true
		deadSprite = get_node(deadSpritePath)
		liveSprite = get_node(liveSpritePath)

func _process(delta):
	if shouldBeDead and not isDead and not ressurectionTime:
		score -= (delta * 5)

func die():
	if not isDead:
		shouldBeDead = true
		eye1.texture = whiteEye
		eye2.texture = whiteEye
		eye1.visible = true
		eye2.visible = true

func ressurect():
	if not isDead:
		ressurectionTime = true
		eye1.texture = redEye
		eye2.texture = redEye
		eye1.visible = true
		eye2.visible = true
		Mainscript.score -= 2

func reap_soul():
	isDead = true
	eye1.texture = blackEye
	eye2.texture = blackEye
	eye1.visible = true
	eye2.visible = true
	soul.start()
	Mainscript.score += score

func early_death():
	isDead = true
	eye1.texture = blackEye
	eye2.texture = blackEye
	eye1.visible = true
	eye2.visible = true
	soul.start()
	if hasDeadSprite:
		deadSprite = get_node(deadSpritePath)
		deadSprite.visible = true
		liveSprite.visible = false
	Mainscript.score -= 10
