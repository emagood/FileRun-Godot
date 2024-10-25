extends Node2D

const SAVE_DIR = "res://saves/"

@onready var console_label = $CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/Console/ScrollContainer/ConsoleLabel
@onready var key_user = $CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/TextEdit
@onready var value_user = $CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/TextEdit2
@onready var save_text = $CanvasLayer/HBoxContainer/savefile

var save_name = "save.dat"
var save_path = SAVE_DIR 


var data = {
		"name" : "Paw Bearer",
		"jump_height" : 2.5,
		"max_health" : 6,
		"health" : 4,
		"strength" : 11,
	}


var array_var = {}


func _ready() -> void:


	dir_contents("res://")
	
	#var dir = Directory.new()
	#var path = "res://nueva_carpeta"
	#if dir.dir_exists(path):
		#print("La carpeta ya existe.")
	#else:
		#var err = dir.make_dir(path)
		#if err == OK:
			#print("Carpeta creada exitosamente.")
		#else:
			#print("Error al crear la carpeta: ", err
	
	
	var dir = DirAccess.open("res://")
	var path = "res://saves"
	if dir.dir_exists(path):
		print("La carpeta ya existe.")
	else:
		var err = dir.make_dir(path)
		if err == OK:
			print("Carpeta creada exitosamente.")
		else:
			print("Error al crear la carpeta: ", err)


func _on_SaveButton_pressed():
	
	save_path = SAVE_DIR + save_text.text
	var file = FileAccess.open_encrypted_with_pass(save_path, FileAccess.WRITE, "P@paB3ar6969")
	var error = file.get_open_error()
	if error == OK:
		file.store_var(data)
		file.close()
	prints(data.size())
	console_write("data saved")




func _on_LoadButton_pressed():
	save_path = SAVE_DIR + save_text.text
	var file = FileAccess.open_encrypted_with_pass(save_path, FileAccess.READ, "P@paB3ar6969")
	if file.file_exists(save_path):
		var error = file.get_open_error()
		if error == OK:
			var data = file.get_var()
			self.data = data
			prints(data)
			file.close()
			console_write(data)
	
	console_write("data loaded")




func console_write(value):
	set_deferred("scroll_horizontal", 600)
	console_label.text += str(value) + "\n"
	
	
	
func _input(event: InputEvent) -> void:
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/Console/ScrollContainer.scroll_vertical = 600
	set_deferred("scroll_vertical", 600)
	if Input.is_key_pressed(KEY_A):
		data["Godot"] = {
		"First Array": [1, 2, 3, 4,3,4,4,3,4,5,4,5,898,7,9,5,7,6,5,7,7,6,7,6,5,6,7,5,3,6,363,63,6736,3,36,36,36,3,63,63,6,3,63,663,63,63,6,345345,3,53,5646,356,45,64,7645,65,456,654,756,6],
		"Array": [1,892,"holaaaa" ,3, 4,3,4,4,3,4,5,4,5,898,7,9,5,7,6,5,7,7,6,7,6,5,6,7,5,3,6,363,63,6736,3,36,36,36,3,63,63,6,3,63,663,63,63,6,345345,3,53,5646,356,45,64,7645,65,456,654,756,6] }
		var array = data["Godot"]
		data["ema"] = "hola fuerfjgnrtjughjrujtgnv"
		var array2 = data["Godot"]
		array2["Array"].insert(0, "cambie esto") 
		prints(array2["Array"])
		prints(array["First Array"])
		array_var = array["First Array"]
		prints(data.is_empty())
		prints(data.has("Godot"))
		data.erase("Godot")
		prints(data)
	if Input.is_key_pressed(KEY_S): data.clear()



func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				print("file estencion: " + file_name.get_extension())
				if file_name.get_extension() == "gd" : prints("estencion gd")
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")




func _on_save_key_pressed() -> void:
	if key_user.text == "":
		console_write("se olvido de ingresar una key")
		return
	if data.has(key_user.text):
		console_write(str("la key " ,key_user.text,"  existe pruebe otra key"))
		prints("la key " ,key_user.text,"  existe  pruebe otra key")
		return
	if value_user.text == "":
		console_write("se olvido de ingresar un valor")
		return
	data[key_user.text] = value_user.text
	pass 


func _on_button_pressed() -> void:
	console_label.text = ""
	console_write("emanuel casuriaga https://github.com/emagood")
	console_write(" ")
	console_write(" ")
	console_write("es un trabajo derivado de este ")
	console_write("save-and-load es para godot 3.2 ")
	console_write("https://github.com/GameEndeavor/save-and-load")
	pass 


func _on_borrar_pressed() -> void:
	console_label.text = ""
	pass 
