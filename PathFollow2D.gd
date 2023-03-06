extends PathFollow2D

@export var increment: float = 0.00
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	progress_ratio += increment


func _on_timer_timeout():
	increment = 0.002 # Replace with function body.
