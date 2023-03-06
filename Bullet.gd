extends Sprite2D
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
var init_angle: float = 0
var init_speed: float = 400

func _ready():
	rotation = init_angle
func _process(delta):
	self_modulate.r = randf() * 1.2
	self_modulate.g = randf() * 2
	self_modulate.b = randf() * 2
	position += Vector2(cos(init_angle), sin(init_angle)) * init_speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
