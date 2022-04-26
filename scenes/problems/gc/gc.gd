extends Control

func load_FASTA(path:String) -> Dictionary:
	var file = File.new()
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	
	# Split on new-line. nt segment will also have newlines, so need to take into account.
	content = content.split("\n")
	var fasta_dict : Dictionary = {}
	var current_key = ""
	for line in content:
		if line.empty():
			continue
		if line[0] == ">":
			line[0] = ""
			current_key = line
			fasta_dict[current_key] = {"nt_string":""}
		else:
			fasta_dict[current_key]["nt_string"] += line
	return fasta_dict

func _on_FileDialog_file_selected(path: String) -> void:
	var FASTA : Dictionary = load_FASTA(path)
	
	var largest_key : String
	var largest_ratio : float = 0.0
	
	for key in FASTA.keys():
		var inner_dict = FASTA[key]
		var cg : float = 0.0
		var ta : float = 0.0
		for character in inner_dict["nt_string"]:
			match character:
				"A", "T":
					ta += 1.0
				"G", "C":
					cg += 1.0
		var local_ratio = cg/(cg+ta)
		if local_ratio > largest_ratio:
			largest_ratio = local_ratio
			largest_key = key
		FASTA[key]["ratio"] = local_ratio
	
	$"RichTextLabel".text = "%s\n%s" % [largest_key, largest_ratio*100.0]

func _on_Button_pressed() -> void:
	$"FileDialog".popup()
