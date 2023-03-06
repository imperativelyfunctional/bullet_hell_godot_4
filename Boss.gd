extends Sprite2D

@onready var Canon = preload("res://canon.tscn")

var degree: float = 0
const parent_offset = Vector2(-25, -25)

func _ready():
	var half_width = get_texture().get_size().x / 2.0
	const number = 8
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 5;
	timer.connect("timeout", _update_degree)
	add_child(timer)
	var child_timer = Timer.new()
	child_timer.autostart = true
	child_timer.wait_time = 20;
	child_timer.connect("timeout", _update_children)
	add_child(child_timer)
	for n in range(0, number):
		var canon = Canon.instantiate()
		canon.position = Vector2(cos( 2 * PI * n / number), sin( 2 * PI * n / number)) * half_width + parent_offset
		canon.rotation = 2 * n * PI / number
		canon.color = Color.TRANSPARENT
		add_child(canon)

func _update_children():
	var child_rotation = randf_range(-10, 10)
	for i in range(get_child_count()):
		if get_child(i) is Canon:
			(get_child(i) as Canon).degree = child_rotation
		
func _update_degree():
	degree = randf_range(-10, 10)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self_modulate.b = randf() * 5
	self_modulate.r = randf() * 10
	self_modulate.b = randf() * 5
	rotation += deg_to_rad(degree)
