extends Area2D

var velocity = Vector2()
var clickable:bool = false
@onready var speed:float = 25
var hp:int = 100
var player_dmg:int = 1
var min_essence:int = 12
var max_essence:int = 30
var essence_dropped:int = 0
var rng = RandomNumberGenerator.new()
var slime_particles = preload("res://scenes/slime_particles.tscn")

var click_cooldown = 0.35

@onready var slime: Area2D = $"."
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurt_colouration_timer: Timer = $Hurt_colouration_timer
var slime_slime = load("res://scenes/slime_particles.tscn")


#tracks if slime is allowed to be clicked
func _on_mouse_entered():
	clickable = true
	#slime_died()#sorry bohden this is just temporary because there was an issue with the essence and i have no clue how to fix it
	
	
	
#tracks if slime is allowed to be clicked
func _on_mouse_exited():
	clickable = false
	

func _process(_delta: float) -> void:
	
	if clickable: #if mouse is on slime and click is off cooldown
		
		if Input.is_action_just_pressed("click"): #if clicked
			deal_damage(player_dmg)
			


#when any animation is finished
func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("New idle")

#deal
func deal_damage(dmg):
	hp -= player_dmg #deal damage to health
	animated_sprite.modulate = Color(1.0, 1.0, 1.0, 0.792)
	hurt_colouration_timer.start()
	
	
	if hp <= 0: #if drops to 0 health
		var essence_dropped:int = rng.randf_range(min_essence,max_essence) #random num between min and max
		game_manager.get_essence(essence_dropped) #essence added to collected essence
		slime_died() #delete slime


func _physics_process(delta: float) -> void:
	if Global.gub != null: #sees if gub exists
		velocity = global_position.direction_to(Global.gub.global_position)
	#velocity is set to where the gub is
	global_position += velocity * speed * delta
	#the poisiton of the slime is set a bit closer to gub
	
func slime_died():
	var slime_juice = slime_slime.instantiate()
	slime_juice.global_position = global_position
	get_tree().get_root().add_child(slime_juice)
	Global._wave_counter()


	queue_free()


func _on_hurt_colouration_timer_timeout() -> void: #when hurt timer ends
	animated_sprite.modulate = Color(1.0, 0.0, 1.0, 1.0) #return to default value
