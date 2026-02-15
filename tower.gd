extends Node2D

var shoot_cooldown = 1.0 #seconds between shots
var time_since_shot = 0.0
var projectile_scene = preload("res://projectile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Range.area_entered.connect(_on_enemy_entered_range)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_since_shot += delta
	
	if time_since_shot >= shoot_cooldown:
		shoot()
		time_since_shot = 0.0
		
func shoot():
	var enemies_in_range = $Range.get_overlapping_areas()
	
	if enemies_in_range.size() > 0:
		var target = enemies_in_range[0].get_parent()
		spawn_projectile(target)

func spawn_projectile(target):
	var projectile = projectile_scene.instantiate()
	projectile.target = target
	projectile.global_position = global_position
	
	get_tree().root.add_child(projectile)
	print("Tower shot projectile at enemy")
	

func _on_enemy_entered_range(body):
	print("Enemy entered tower range!")
