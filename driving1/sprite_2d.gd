extends Sprite2D

var dragging := false
var start_angle := 0.0
var steering_angle := 0.0

const MAX_ROTATION := deg_to_rad(30)

func _input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			dragging = true
			start_angle = global_angle_to(event.position)
		elif not event.pressed:
			dragging = false
	elif event is InputEventScreenDrag or event is InputEventMouseMotion:
		if dragging:
			var current_angle = global_angle_to(event.position)
			var delta_angle = current_angle - start_angle
			start_angle = current_angle
			steering_angle += delta_angle
			steering_angle = clamp(steering_angle, -MAX_ROTATION, MAX_ROTATION)
			rotation = steering_angle
	

func _process(delta):
	if not dragging:
		steering_angle = lerp(steering_angle, 0.0, delta * 5)
		rotation = steering_angle
	Global.angle=rotation

func global_angle_to(point):
	var center = global_position
	return (point - center).angle()
