extends Control


func reverse_complement(nt_string : String) -> String:
	var rc_string = ""
	for i in range(nt_string.length()):
		match nt_string[-1 - i]:
			"A":
				rc_string += "T"
			"C":
				rc_string += "G"
			"G":
				rc_string += "C"
			"T":
				rc_string += "A"
	
	return rc_string


func _on_Button_pressed() -> void:
	$"RichTextLabel".text = reverse_complement($"TextEdit".text)
