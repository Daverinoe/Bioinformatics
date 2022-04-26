extends Control

func transcribe_to_rna(nt_string : String) -> String:
	var rna_string = nt_string.replace('T', 'U')
	return rna_string

func _on_Button_pressed() -> void:
	$"RichTextLabel".text = transcribe_to_rna($"TextEdit".text)
