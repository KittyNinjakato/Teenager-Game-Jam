extends Node

var slime = preload("res://scenes/slime.tscn")


func _on_enemy_spawning_timer_timeout():
	var enemy_position = Vector2(randf_range(-160,1300), randf_range(-90,390))
	
	
	while enemy_position.x < 1210 and enemy_position.x > -80 and enemy_position.y < 690 and enemy_position.y > -45:
		enemy_position = Vector2(randi_range(-160,1230), randi_range(-90,1000))
		
		
	var slime_instanciate = slime.instantiate()
	add_child(slime_instanciate)
	slime_instanciate.position = enemy_position
	
