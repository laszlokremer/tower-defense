extends PathFollow2D

var speed = 100 #pixels per second
var health = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += speed * delta
	
func take_damage(amount):
	health -= amount
	print("Enemy took ", amount, "damage. Health: ", health)
	
	if health <= 0:
		die()
		
func die():
	print("Enemy died!")
	queue_free()
