extends Node

var slime = preload("res://scenes/slime.tscn")
var amount_spawned = 0

func _on_enemy_spawning_timer_timeout():
	print("amount spawned",amount_spawned)
	print("how many should spawn",Global.slimes_per_wave[Global.wave_num])
	
	#sees if the amount of slimes is the same as how many slimes should spawn and if the wave has ended
	if amount_spawned ==  Global.slimes_per_wave[Global.wave_num] and Global.wave_end == true:
	#if the wave has ended amount of slimes is reset 
		amount_spawned = 0
	#if the wave has ended has reset
		Global.wave_end = false
	#the wave we are on is increased
		Global.wave_num += 1
	
	
	#if the amount of slimes is less then how many there should be
	#and the wave hasnt ended
	if amount_spawned < Global.slimes_per_wave[Global.wave_num] and Global.wave_end == false:
		
		
	
	#********************************************************************************************************************
		#position finder
		var enemy_position = Vector2(randi_range(-180,1310), randi_range(-145,790))
		#generates a random position
		#checks if the poisiton is within the visible screen
		while enemy_position.x < 1210 and enemy_position.x > -80 and enemy_position.y < 690 and enemy_position.y > -45:
		#if it is it will pick a new position
			enemy_position = Vector2(randi_range(-180,1310), randi_range(-145,790))
	#********************************************************************************************************************	
		#spawns the slimes in	
		var slime_instanciate = slime.instantiate()
		add_child(slime_instanciate)
		#sets the slimes spawn position to generated position
		slime_instanciate.position = enemy_position 
		#generates a random position
		
		#this tells us how many slimes have been spawned
		amount_spawned += 1
	
	
	
