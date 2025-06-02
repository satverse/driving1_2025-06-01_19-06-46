class_name select_car
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Yaha pe error tha main saare buttons ka ek common function bana raha tha but failed so i manually add the common function in all buttons
	for child in $TextureRect/MarginContainer/VBoxContainer/HBoxContainer.get_children():
		if child is Button:
			print("yes")
			child.button_down.connect(Callable(self, "back_to_menu").bind(child), CONNECT_DEFERRED)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func back_to_menu():
	print("MM")
	get_tree().change_scene_to_file("res://scenes/play_menu.tscn")


func _on_button_1_pressed() -> void:
	Global.selected_car=1
	back_to_menu()


func _on_button_2_pressed() -> void:
	Global.selected_car=2
	back_to_menu()

func _on_button_3_pressed() -> void:
	Global.selected_car=3
	back_to_menu()

func _on_button_4_pressed() -> void:
	Global.selected_car=4
	back_to_menu()

func _on_button_5_pressed() -> void:
	Global.selected_car=5
	back_to_menu()

func _on_button_6_pressed() -> void:
	Global.selected_car=6
	back_to_menu()

func _on_button_7_pressed() -> void:
	Global.selected_car=7
	back_to_menu()


func _on_button_8_pressed() -> void:
	Global.selected_car=8
	back_to_menu()
	
func _on_button_9_pressed() -> void:
	Global.selected_car=9
	back_to_menu()

func _on_button_10_pressed() -> void:
	Global.selected_car=10
	back_to_menu()
