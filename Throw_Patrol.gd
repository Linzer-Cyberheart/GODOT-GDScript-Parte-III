extends Node2D

var x = false
var damage = 50

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$AnimationPlayer.play("Throw")
		x = true

func _on_DamageArea_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


