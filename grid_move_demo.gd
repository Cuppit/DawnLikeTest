extends Node


# This code adapted from the Godot Engine documentation about saving/loading data
# (https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html#saving-and-reading-data)
# My adaptation expects a filename from 
func get_json_data(filename):
	#var json_data = null
	
	
	if not FileAccess.file_exists(filename):
		return #error: no database exists
		
	# Load file line-by-line, then process the string data as a dictionary
	var data_file = FileAccess.open(filename, FileAccess.READ)
	while data_file.get_position() < data_file.get_length():
		var json_string = data_file.get_line()
		
		# Creates the helper class to interact with JSON
		var json = JSON.new()
		
		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		
		# Get the data from the JSON object
		#json_data = json.get_data()
	
		
	

# Called when the node enters the scene tree for the first time.
func _ready():
	var test_json = get_json_data("res://Databases/testdb.json")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
