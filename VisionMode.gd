extends CanvasModulate

const DARK = Color("1b1919")
const NIGHTVISION = Color("4dff5c")
const HOUSEVISION = Color("050505")
const CITYVISION = Color("0e0e0e")
var cityvision = false
var housevision = false
var nv = false

func _ready():
	add_to_group("interface")
#	color = DARK
#	get_tree().call_group("labels", "hide")
	
func level(x,y,z,j):
	if x == true and y == false and z == false and j == false:
		color = DARK
		cityvision = false
		housevision = false
		get_tree().call_group("labels", "hide")
		
	if x == false and y == true and z == false and j == false:
		cityvision = true
		housevision = true
		
	if x == false and y == false and z == true and j == false:
		cityvision = true
		housevision = true
	
	if x == false and y == false and z == false and j == true:
		cityvision = true
		housevision = true
	
func HouseVision_mode():
	inform_npcs("HouseVision_mode")
	color = HOUSEVISION
	$AudioStreamPlayer.stream = load(Global.house_vision_sfx)
	play_sfx()
	get_tree().call_group("labels", "hide")
	nv = false
	get_tree().call_group("labels", "nv_on", nv)
	housevision = true

func CityVision_mode():
	inform_npcs("CityVision_mode")
	color = CITYVISION
	get_tree().call_group("labels", "hide")
	nv = false
	get_tree().call_group("labels", "nv_on", nv)
	cityvision = true

func NightVision_mode():
	if housevision == false:
		inform_npcs("NightVision_mode")
		color = NIGHTVISION
		$AudioStreamPlayer.stream = load(Global.nightvision_on_sfx)
		play_sfx()
		get_tree().call_group("labels", "show")
		nv = true
		get_tree().call_group("labels", "nv_on", nv)
		


func DarkVision_mode():
	if housevision == false:
		inform_npcs("DarkVision_mode")
		color = DARK
		$AudioStreamPlayer.stream = load(Global.nightvision_off_sfx)
		play_sfx()
		get_tree().call_group("labels", "hide")
		nv = false
		get_tree().call_group("labels", "nv_on", nv)


func play_sfx():
	$AudioStreamPlayer.play()


func inform_npcs(vision_mode):
	get_tree().call_group("npc", vision_mode)

var active = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		HouseVision_mode()
		active = true
		

func _on_Area2D2_body_entered(body):
	if body.has_node("Paxton"):
		housevision = false
		if body == Global.Player:
			$AudioStreamPlayer.stream = load("res://SFX/heartbeat.wav")
			color = DARK
			active = false

func _on_Area2D3_body_entered(body):
	if body.has_node("Paxton"):
		housevision = false
		if body == Global.Player:
			$AudioStreamPlayer.stream = load("res://SFX/heartbeat.wav")
			color = DARK
			active = false
