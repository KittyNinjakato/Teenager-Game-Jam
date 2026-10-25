extends Node

var health:int = 20
var essence:int = 1000

func lil_guy_takes_dmg(dmg):
	health -= dmg
	#print("health: " + str(health))
	if health <= 0:
		print("You lost!")
	return health

func get_essence(amount):
	essence += amount
	#print("essence: " + str(essence))

func spend_essence(cost,bought): #validates purchases and removes essense bsaed on price
	if essence < cost or bought: #if youre too broke or skill is already purchased
		return "fail" 
	else: #if you have enough essense and skill isnt purchased
		essence -= cost #remove essence from player
		return "pass"



var off_cooldown:bool = true
@onready var click_cooldown_timer: Timer = $"../Click_cooldown"


func start_click_cooldown(cooldown): #when player clicks on a slime
	
	click_cooldown_timer.wait_time = cooldown #set wait time to cooldown time
	
	off_cooldown = false 
	click_cooldown_timer.start() #start the cooldown timer

func _on_click_cooldown_timeout() -> void: #on cooldown timer end
	off_cooldown = true

func check_click_cooldown(): #when player tries to click slime
	return off_cooldown #return state of cooldown
