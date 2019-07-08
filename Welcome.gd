extends Node2D

var text
var x = 0

func _ready():
	$Timer.start()
	$AnimationPlayer.play("Passeio")
	text = get_json()
	update_message(x)
	$WelcomeGUI/Popup.show()

func _input(event):
	if Input.is_action_just_pressed("ui_skip"):
		Global.level1 = true
		get_tree().change_scene("res://Scenes/Loadscreen.tscn")


func get_json():
	var file = File.new()
	file.open(Global.welcome_messages, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)
	

func update_message(number):
	$WelcomeGUI/AnimationPlayer.play("Transition")
	$WelcomeGUI/Popup/NinePatchRect/Label.text = text[str(number)]


func _on_Timer_timeout():
	if x <= 43:
		x = x + 1
		update_message(x)
	elif x == 43:
		$Door.play()
	else:
		$Door.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	$Door.play()


func _on_Door_finished():
	Global.level1 = true
	get_tree().change_scene("res://Scenes/Loadscreen.tscn")
