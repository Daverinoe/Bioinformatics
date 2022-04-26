extends Control

func count_nucleotides(nt_string : String) -> String:
	var a_nt = 0
	var g_nt = 0
	var c_nt = 0
	var t_nt = 0
	
	for nt in nt_string:
		match nt:
			"A":
				a_nt += 1
			"C":
				c_nt += 1
			"G":
				g_nt += 1
			"T":
				t_nt += 1
	
	var out_array = [a_nt, c_nt, g_nt, t_nt]
	
	return "%s %s %s %s" % out_array


func _on_Button_pressed() -> void:
	$"RichTextLabel".text = count_nucleotides($"TextEdit".text)
