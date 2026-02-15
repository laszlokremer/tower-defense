extends Node2D

var speed = 300
var target = null
var damage = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target == null or not is_instance_valid(target):
		queue_free()
		return
	
	var direction = (target.global_position - global_position).normalized()
	
	global_position += direction * speed * delta
	
	if global_position.distance_to(target.global_position) < 10:
		hit_target()
		
func hit_target():
	print("Hit enemy!")
	target.take_damage(damage)
	queue_free()
