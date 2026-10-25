extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $GUBB
@onready var slime: Area2D = $"."

var rng = RandomNumberGenerator.new()
var min_slime_dmg = 3 #lowest num dmg can be
var max_slime_dmg = 6 #one more than the highest num dmg can be

func _ready():
	Global.gub = self

func _exit_tree():
	Global.gub = null

func _on_area_entered(_area: Area2D) -> void:
	var dmg_dealt:int = rng.randf_range(min_slime_dmg,max_slime_dmg) #random num between min and max
	var hp = game_manager.lil_guy_takes_dmg(dmg_dealt)
	#animated_sprite.play("takes_dmg")
	print(hp)

func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
