extends Node2D

@onready var arrow = $CanvasLayer/arrow
var finish_line_position
var finish_line
var my_pos
var me

func _ready():
	# Finish line node ko get karo (path apne hisaab se set karo)
	finish_line = get_node("starting")
	finish_line_position = finish_line.position
	me=get_node("car")
	my_pos=me.global_position
	

func _process(delta):
	my_pos=me.global_position
	finish_line_position = finish_line.position
	var direction = (finish_line_position - my_pos)#.normalized()
	var angle = direction.angle()

	# Since arrow ko setup mein hi 90° rotate kiya hai, us rotation ko minus karo
	arrow.rotation = angle + deg_to_rad(90)


func _on_up_button_down() -> void:
	Input.action_press("up")

func _on_down_button_down() -> void:
	Input.action_press("down")

func _on_right_button_down() -> void:
	Input.action_press("right")

func _on_left_button_down() -> void:
	Input.action_press("left")

func _on_up_button_up() -> void:
	Input.action_release("up")

func _on_down_button_up() -> void:
	Input.action_release("down")

func _on_right_button_up() -> void:
	Input.action_release("right")

func _on_left_button_up() -> void:
	Input.action_release("left")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/play_menu.tscn")
