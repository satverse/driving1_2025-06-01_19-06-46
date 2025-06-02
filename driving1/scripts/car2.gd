extends CharacterBody2D

@export var acceleration := 400.0
@export var max_speed := 250.0
@export var friction := 300.0
var rotation_speed# = get_parent().get_node("CanvasLayer").get_node("Sprite2D").current_angle  # Radians per second
#info be like [x,y,width,height]
var game_over=false
var car_info=Global.car_info


var s1:=false
var s2:=false
var s3:=false

func _ready():
	
	var atlas = $Sprite2D.texture
	if atlas is AtlasTexture:
		atlas.region = Rect2(car_info[Global.selected_car][0],car_info[Global.selected_car][1],car_info[Global.selected_car][2],car_info[Global.selected_car][3])

	

func _physics_process(delta: float) -> void:
	if game_over:
		return
	rotation_speed = 2*Global.angle#().get_node("CanvasLayer").get_node("Sprite2D").current_angle
	var screen_size = get_viewport().get_visible_rect().size
	var screen_width = screen_size.x
	var screen_height = screen_size.y

	var direction := 0.0
	rotation += rotation_speed * delta
	# Rotation
	if Input.is_action_pressed("left"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("right"):
		rotation += rotation_speed * delta

	# Forward / Backward Movement
	if Input.is_action_pressed("up"):
		direction = 1.0
	elif Input.is_action_pressed("down"):
		direction = -1.0

	# Calculate velocity based on direction and rotation
	if direction != 0:
		velocity += Vector2.RIGHT.rotated(rotation) * direction * acceleration * delta
	else:
		# Apply friction
		if velocity.length() > 0:
			var friction_force = friction * delta
			velocity = velocity.move_toward(Vector2.ZERO, friction_force)

	# Clamp to max speed
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("start1"):
		if s3==true:
			s1=true
			print("You Won")
			game_over=true
			s3=false
			get_parent().get_node("CanvasLayer/back").visible=true
			get_parent().get_node("CanvasLayer/Label").visible=true
			#get_tree().change_scene_to_file("res://scenes/end.tscn")
	elif area.is_in_group("start2"):
		if s3==false:
			s2=true
		else:
			s2=false
			s3=false
	elif area.is_in_group("start3"):
		if s2==true:
			s3=true
