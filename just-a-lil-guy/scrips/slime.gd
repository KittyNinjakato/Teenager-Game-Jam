extends Area2D

var velocity = Vector2()
var clickable:bool = false
@onready var speed:float = 25
var hp:int = 5
var player_dmg:int = 1
var min_essence:int = 2
var max_essence:int = 5
var essence_dropped:int = 0
var rng = RandomNumberGenerator.new()

var click_cooldown = 0.35

@onready var slime: Area2D = $"."
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %game_manager



#tracks if slime is allowed to be clicked
func _on_mouse_entered():
	clickable = true
	slime_died()#sorry bohden this is just temporary because there was an issue with the essence and i have no clue how to fix it
	
	
	
#tracks if slime is allowed to be clicked
func _on_mouse_exited():
	clickable = false
	

func _process(_delta: float) -> void:
#	var is_off_cooldown = game_manager.check_click_cooldown()
#	if clickable and is_off_cooldown: #if mouse is on slime and click is off cooldown
		
		if Input.is_action_just_pressed("click"): #if clicked
			
			hp -= player_dmg #deal damage to health
			animated_sprite.play("takes_dmg") #play damage animation
			
			game_manager.start_click_cooldown(click_cooldown)
			
			print("youch")
			if hp <= 0: #if drops to 0 health
			#	var essence_dropped:int = rng.randf_range(min_essence,max_essence) #random num between min and max
				game_manager.get_essence(essence_dropped) #essence added to collected essence
				slime_died() #delete slime


#when any animation is finished
func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("New idle")



func _physics_process(delta: float) -> void:
	if Global.gub != null: #sees if gub exists
		velocity = global_position.direction_to(Global.gub.global_position)
	#velocity is set to where the gub is
	global_position += velocity * speed * delta
	#the poisiton of the slime is set a bit closer to gub
	
func slime_died():
	Global._wave_counter()
	queue_free()
