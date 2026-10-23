extends Area2D
@onready var game_manager: Node = %game_manager
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var slime: Area2D = $"."




func _on_area_entered(area: Area2D) -> void:
	var hp = game_manager.lil_guy_takes_dmg(5)
	animated_sprite.play("takes_dmg")
	print(hp)

func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
