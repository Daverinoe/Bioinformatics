extends Control




func _on_Button_pressed() -> void:
	$"FileDialog".popup()


func _on_FileDialog_file_selected(path: String) -> void:
	var nt_strings : PoolStringArray = load_nt_strings(path)
	$"RichTextLabel".text = str(calculate_hamming_distance(nt_strings))

func load_nt_strings(path:String) -> PoolStringArray:
	var file = File.new()
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("\n")

func calculate_hamming_distance(nt_strings:PoolStringArray) -> int:
	var hamming_distance = 0
	for i in nt_strings[0].length():
		var char1 = nt_strings[0][i]
		var char2 = nt_strings[1][i]
		if char1 != char2:
			hamming_distance += 1
		
	return hamming_distance
