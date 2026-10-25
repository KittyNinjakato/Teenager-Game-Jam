extends Node

var health:int = 20
var essence:int = 0

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
