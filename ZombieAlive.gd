extends Node2D


func _on_Area2D_body_entered(body):
	if Global.Player.has_node("Knife"):
		if Input.is_action_just_pressed("ui_stab"):
			queue_free()
