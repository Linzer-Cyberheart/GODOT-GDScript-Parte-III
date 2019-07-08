extends Area2D

var x = false

func _on_Zoom_body_entered(body):
	if body == Global.Player and x == false:
		Global.Camera2D2.zoom1 = Vector2(1,1)
		x = true


func _on_Zoom_body_exited(body):
	if body == Global.Player and x == true:
		Global.Camera2D2.zoom1 = Vector2(0.7,.07)
		x = false