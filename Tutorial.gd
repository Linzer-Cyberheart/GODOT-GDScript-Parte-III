extends Node2D

var text

func _ready():
	text = get_json()
	update_pointer_position(0)
	$TutorialGUI/Popup.show()
	


func get_json():
	var file = File.new()
	file.open(Global.tutorial_messages, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)


func update_pointer_position(number):
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(number)
	pointer.position = marker.position
	$Tween.interpolate_property(pointer, "position", pointer.position, marker.position, 
			0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$AudioStreamPlayer.play()
	$TutorialGUI/AnimationPlayer.play("Transition")
	$TutorialGUI/Popup/NinePatchRect/Label.text = text[str(number)]


func _on_MoveObjective_body_entered(body):
	update_pointer_position(1)



func _on_DoorObjective_body_entered(body):
	update_pointer_position(3)
	


func _on_NightVisionObjective_body_entered(body):
	update_pointer_position(5)
	


func _on_ExitObjective_body_entered(body):
	update_pointer_position(9)
	


func _on_Files_body_entered(body):
	update_pointer_position(8)
	


func _on_SuitCase_body_entered(body):
	update_pointer_position(6)
	

func _on_Recorder_body_entered(body):
	update_pointer_position(7)
	


func _on_Lantern_body_entered(body):
	update_pointer_position(2)
	
	

func _on_RoofObjective2_body_entered(body):
	update_pointer_position(4)
	
