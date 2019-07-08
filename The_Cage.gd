extends Node2D


func _ready():
	$AnimationPlayer.play("light")



func _on_Music_SFX_finished():
	queue_free()
