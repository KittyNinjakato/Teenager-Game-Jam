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

func spend_essense(cost):
	essence -= cost
