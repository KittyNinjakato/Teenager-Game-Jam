extends Node

var gub_health:int = 20
var gub_max_health:int = 20
var essence:int = 0
var purchased_skills = []

var healing_power:int = 4


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


func _process(_delta: float) -> void:
	
	#heal spell
	if Input.is_action_just_pressed("f_ability"): #if pressed F
		
		print("before heal: " + str(gub_health))
		if gub_health + healing_power >= gub_max_health: #if healing will exceed max hp
			gub_health = gub_max_health #set hp to max
		else:
			gub_health += healing_power #heal gub
		print("after heal: " + str(gub_health))
		
		#await get_tree().create_timer(1.0).timeout
		get_tree().create_timer(3)
