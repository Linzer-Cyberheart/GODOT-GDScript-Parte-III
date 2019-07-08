extends Node2D

var active = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$Area2D/Office.play()
		active = true


func _on_Area2D_body_exited(body):
	if body == Global.Player:
		$Area2D/City.play()
