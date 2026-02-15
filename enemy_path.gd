extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var line = $PathVisual
	
	if curve:
		line.points = curve.get_baked_points()
		line.width = 5
		line.default_color = Color.WHITE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
