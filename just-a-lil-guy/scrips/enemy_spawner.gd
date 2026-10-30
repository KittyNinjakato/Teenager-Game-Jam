extends Node

var slime = preload("res://scenes/slime.tscn")
var OSCAR = preload("res://scenes/OSCAR.tscn")
var amount_spawned = 0
var oscar_wave:bool = false




func _on_enemy_spawning_timer_timeout():
	#print("amount spawned",amount_spawned)
	#print("how many should spawn",Global.slimes_per_wave[Global.wave_num])
	
	#sees if the amount of slimes is the same as how many slimes should spawn and if the wave has ended
	if amount_spawned ==  Global.slimes_per_wave[Global.wave_num] and Global.wave_end == true:
		#if the wave has ended amount of slimes is reset 
		amount_spawned = 0
		#if the wave has ended has reset
		Global.wave_end = false
		#the wave we are on is increased
		Global.wave_num += 1
		
		get_tree().change_scene_to_file("res://scenes/skill_tree_ui.tscn")
		
	
	
	#if the amount of slimes is less then how many there should be
	#and the wave hasnt ended
	if amount_spawned < Global.slimes_per_wave[Global.wave_num] and Global.wave_end == false:
		
		
	
	#********************************************************************************************************************
		#position finder
		var enemy_position = Vector2(randi_range(-180,1310), randi_range(-145,790))
		#generates a random position
		#checks if the poisiton is within the visible screen
		#checks if the position is within the visible screen
		while enemy_position.x < 1210 and enemy_position.x > -80 and enemy_position.y < 690 and enemy_position.y > -45:
		#if it is it will pick a new position
			enemy_position = Vector2(randi_range(-180,1310), randi_range(-145,790))
	#********************************************************************************************************************
		#Spawning OSCAR in
		if Global.OSCAR_per_wave[Global.wave_num] != 0:
			for each in range(Global.OSCAR_per_wave[Global.wave_num]):
				var OSCAR_ENTERS = OSCAR.instantiate()
		#sets OSCARS spawn position to generated position
				OSCAR_ENTERS.position = enemy_position 
				add_child(OSCAR_ENTERS)
	#********************************************************************************************************************	
		else:
		#spawns the slimes in	
			var slime_instanciate = slime.instantiate()
		#sets the slimes spawn position to generated position
			slime_instanciate.position = enemy_position 
			add_child(slime_instanciate)

		
		#this tells us how many things have been spawned
		amount_spawned += 1
	
	
	
	
