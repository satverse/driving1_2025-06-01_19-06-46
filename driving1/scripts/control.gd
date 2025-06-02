extends Control

var car_info=Global.car_info
var current=0
var num=10#number of cars
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current==0:
		$left.disabled=true
	else:
		$left.disabled=false
	if current==num:
		$right.disabled=true
	else:
		$right.disabled=false
	var atlas = $ColorRect/car.texture
	if atlas is AtlasTexture:
		atlas.region = Rect2(car_info[current+1][0],car_info[current+1][1],car_info[current+1][2],car_info[current+1][3])
	
	


func _on_right_pressed() -> void:
	if current<num:
		current+=1


func _on_left_pressed() -> void:
	if current>0:
		current-=1


func _on_button_pressed() -> void:
	Global.selected_car=current+1
	get_tree().change_scene_to_file("res://scenes/play_menu.tscn")
	
