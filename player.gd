# Simple, basic straightforward grid based movement.  
extends Area2D

@onready var ray = $RayCast2D

var animation_speed = 9
var moving = false
var collider = null # utility variable for checking collisions with the ray.
var fishy = load("res://fishy.tscn")
var fishy_class = fishy.instantiate().get_class()
var tile_size = 16
var inputs = {"right": Vector2.RIGHT,
			 "left": Vector2.LEFT,
			 "up": Vector2.UP,
			 "down": Vector2.DOWN,
			 "up_right": Vector2.UP+Vector2.RIGHT,
			 "down_right": Vector2.DOWN+Vector2.RIGHT,
			 "down_left": Vector2.DOWN+Vector2.LEFT,
			 "up_left": Vector2.UP+Vector2.LEFT}


# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		print("no collision detected, proceeding to move: ")
		#position += inputs[dir] * tile_size
		var tween = create_tween()
		tween.tween_property(self, "position", 
			position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
	else:
		print ("COLLISION DETECTED!")
		collider = ray.get_collider()
		if collider.get_class() == fishy_class:
			print('You found the fishy!')
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
