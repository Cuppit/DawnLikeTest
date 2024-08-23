extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("The list of animations for a Fishy's animatedsprite2d is: ")
	print($AnimatedSprite2D.get_animation())
	$AnimatedSprite2D.play("red_whale")
	print("It seems 'get_animation()' only reports the string name of the current ani, like so:", $AnimatedSprite2D.get_animation())
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
