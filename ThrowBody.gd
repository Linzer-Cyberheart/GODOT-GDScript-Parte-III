extends Node2D

var enter = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and enter == false:
		$AnimationPlayer.play("ThrowBody")
		enter = true