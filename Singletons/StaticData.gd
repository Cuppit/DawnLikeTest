# Data loaded here is accessible to any node, anywhere,
# at any time.

extends Node

var gamedata = {}

var data_file_path = "res://Databases/testdb.json"

# Called when the node enters the scene tree for the first time.
func _ready():
	gamedata = load_json_file(data_file_path)


func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
			
	
	else: 
		print("File doesn't exist!")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
