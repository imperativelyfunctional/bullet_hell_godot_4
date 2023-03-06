extends ColorRect

class_name Canon

const Bullet = preload("res://bullet.tscn")
var degree: float = 0
func _ready():
	var timer = Timer.new()
	timer.connect("timeout", fire)
	add_child(timer)
	timer.start(0.1)
	var timer2 = Timer.new()
	timer2.connect("timeout", fire)
	add_child(timer2)
	timer2.start(0.2)

func _process(_delta):
	rotation += deg_to_rad(degree)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func fire():
	var bullet = Bullet.instantiate()
	bullet.init_angle = rotation
	bullet.position = global_position + get_rect().size/2
	get_tree().root.add_child(bullet)
