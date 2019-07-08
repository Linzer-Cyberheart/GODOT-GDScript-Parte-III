extends Node2D

var damage = 50
var body = Global.Player

func _on_Area2D_body_entered(body):
	if body == Global.Player and not $AnimationPlayer.is_playing():
		$Timer.start()
		$AnimationPlayer.play("TVHorror")
		if body.has_method("take_damage"):
			body.take_damage(damage)


func _on_Area2D_body_exited(body):
	if body == Global.Player and not $AnimationPlayer.is_playing():
		_on_Timer_timeout()

#func _on_AnimationPlayer_animation_finished(anim_name):
#	if body.has_method("take_damage"):
#		body.take_damage(damage)

func _on_Timer_timeout():
	queue_free()

