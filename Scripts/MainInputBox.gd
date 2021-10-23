extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
var old_text = ""
var old_result = ""
var old_prev = 0

func get_text():
	var text = .get_text()

	var result = ""
	var i = 0;
	var prev_insert = 0;

	if old_text == text:
		return old_result + text.substr(old_prev, text.length() - old_prev + 1)
	elif old_text.length() > 0 && old_text.length() < text.length() && old_text == text.left(old_text.length()):
		i = old_text.length() - 1
		prev_insert = old_prev
		result = old_result

	while i < text.length() - 1:
		if text.ord_at(i) > 127 && text.ord_at(i+1) != 32:
			result += text.substr(prev_insert, i - prev_insert + 1) + " "
			prev_insert = i + 1
		i += 1
	
	old_text = text
	old_result = result
	old_prev = prev_insert
	result += text.substr(prev_insert, text.length() - prev_insert + 1)
	return result