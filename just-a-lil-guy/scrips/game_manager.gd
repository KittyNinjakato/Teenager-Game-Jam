extends Node

@onready var starfall_preload = preload("res://scenes/Starfall_hitbox.tscn")

var gub_health:int = 20
var gub_max_health:int = 20
var essence:int = 90
var purchased_skills = ["Skill_button_1"]

var healing_power:int = 4
var heal_cooldown:int = 10
var heal_off_cooldown:bool = true

var acid_speed_mult:float = 0.4
var acid_cooldown:int = 12
var acid_off_cooldown:bool = true

var starfall_dmg:int = 5
var starfall_cooldown:int = 16
var starfall_off_cooldown:bool = true


func _ready() -> void:
		update_health_bar()
	
func reset_stats():
	gub_health = 20
	gub_max_health = 20
	essence = 0
	purchased_skills = ["Skill_button_1"]

	healing_power = 4
	heal_cooldown = 10
	heal_off_cooldown = true

	acid_speed_mult = 0.4
	acid_cooldown = 12
	acid_off_cooldown = true

	starfall_dmg = 5
	starfall_cooldown = 16
	starfall_off_cooldown = true


func lil_guy_takes_dmg(dmg):
	
	gub_health -= dmg
	
	update_health_bar()
	#print("health: " + str(health))
	
	if gub_health <= 0: #on defeat
		get_tree().change_scene_to_file("res://scenes/death.tscn") #swap scene
		music_player.stop_main_music() #stop main music
		music_player.play_death_music() #start detah music
	return gub_health


func get_essence(amount):
	essence += amount
	Global.essence = essence #so essence can be counted
	#print("essence: " + str(essence))


func spend_essence(cost,bought): #validates purchases and removes essense bsaed on price
	if essence < cost or bought: #if youre too broke or skill is already purchased
		return "fail" 
	else: #if you have enough essense and skill isnt purchased
		essence -= cost #remove essence from player
		Global.essence = essence
		return "pass"
	


#PURCHASED SKILLS 
func store_purchased_skill(skill): #when just bought a skill
	purchased_skills.append(skill) #add skill to bought skills

func get_purchased_skills(): 
	return purchased_skills
	
func search_for_purchased_skill(skill):
	if skill in purchased_skills: #if skill is found in purchased skills
		return true
	else:
		return false


func _physics_process(_delta: float) -> void:
	
	
	
	#heal spell
	if Input.is_action_just_pressed("f_ability"): #if pressed F
		var has_heal_spell = search_for_purchased_skill("Skill_button_4") #check if unlocked spell
		#print(has_heal_spell)
		if heal_off_cooldown and has_heal_spell: #if off cooldown and unlocked the spell
			heal_off_cooldown = false
			
			if gub_health + healing_power >= gub_max_health: #if healing will exceed max hp
				gub_health = gub_max_health #set hp to max
				update_health_bar()
				
			else:
				gub_health += healing_power #heal gub
				update_health_bar()
			
			
			#cooldown manager
			var secs = 0
			for i in range(heal_cooldown): #loops once per second of cooldown
				await get_tree().create_timer(1.0).timeout #create 1 seocnd timer
				secs += 1
				print(secs)
				if secs >= heal_cooldown: #if finished cooldown
					heal_off_cooldown = true
					print("off cooldonw")



	#starfall spell
	if Input.is_action_just_pressed("e_ability"): #if pressed E
		
		var mouse_position = Mouse.find_mouse_location() #find mouse position
		var starfall_instance = starfall_preload.instantiate() #create a copy of starfall spell
		add_child(starfall_instance)
		starfall_instance.position = mouse_position #sets spell pos to mouse pos
		
		var has_starfall_spell = search_for_purchased_skill("Skill_button_6") #check if unlocked spell
		if starfall_off_cooldown and has_starfall_spell: #if off cooldown and unlocked the spell
			starfall_off_cooldown = false
			
			
			
			
			#cooldown manager
			var secs = 0
			for i in range(starfall_cooldown):
				await get_tree().create_timer(1.0).timeout #create 1 seocnd timer
				secs += 1
				print(secs)
				if secs >= starfall_cooldown: #if finished cooldown
					starfall_off_cooldown = true
					print("off cooldonw")
