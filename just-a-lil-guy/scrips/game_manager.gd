extends Node

var gub_health:int = 20
var gub_max_health:int = 20
var essence:int = 0
var purchased_skills = []

var healing_power:int = 4
var heal_cooldown:int = 10
var heal_off_cooldown:bool = true

var acid_speed_mult:float = 0.4
var acid_cooldown:int = 12
var acid_off_cooldown:bool = true

var starfall_dmg:int = 5
var starfall_cooldown:int = 16
var starfall_off_cooldown:bool = true


func lil_guy_takes_dmg(dmg):
	gub_health -= dmg
	#print("health: " + str(health))
	if gub_health <= 0:
		get_tree().change_scene_to_file("res://scenes/death.tscn")
	return gub_health


func get_essence(amount):
	essence += amount
	#print("essence: " + str(essence))


func spend_essence(cost,bought): #validates purchases and removes essense bsaed on price
	if essence < cost or bought: #if youre too broke or skill is already purchased
		return "fail" 
	else: #if you have enough essense and skill isnt purchased
		essence -= cost #remove essence from player
		return "pass"


func store_purchased_skill(skill): #when just bought a skill
	purchased_skills.append(skill) #add skill to bought skills

func get_purchased_skills(): 
	return purchased_skills

#@onready var starfall_hitbox: Area2D = $"."
func _process(_delta: float) -> void:
	
	#heal spell
	if Input.is_action_just_pressed("f_ability"): #if pressed F
		if heal_off_cooldown and "skill_button_4" in purchased_skills:
			heal_off_cooldown = false
			
			if gub_health + healing_power >= gub_max_health: #if healing will exceed max hp
				gub_health = gub_max_health #set hp to max
			else:
				gub_health += healing_power #heal gub
			
			var secs = 0
			
			for i in range(heal_cooldown):
				await get_tree().create_timer(1.0).timeout #create 1 seocnd timer
				secs += 1
				print(secs)
				if secs >= heal_cooldown:
					heal_off_cooldown = true
					print("off cooldonw")


	#starfall spell
	if Input.is_action_just_pressed("e_ability") and starfall_off_cooldown: #if pressed E and spell off cooldown
		starfall_off_cooldown = false
		
		#var mouse_location = get_viewport().get_mouse_position()
		#var hitbox_root = Area2D.new()
		#hitbox_root.position = mouse_location
		#var hitbox = CircleShape2D.new()
		#hitbox.parent = hitbox_root
		#hitbox.radius = 100
		#hitbox.collision_layer = 3
		
		
		
		
		var secs = 0
		
		for i in range(heal_cooldown):
			await get_tree().create_timer(1.0).timeout #create 1 seocnd timer
			secs += 1
			print(secs)
			if secs >= heal_cooldown:
				heal_off_cooldown = true
				print("off cooldonw")

#ability unlocks
