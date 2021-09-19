
extends TextureButton

var accessible;

#unc _ready():
	#accessible = AccessibleFactory.recreate_with_name(accessible, self, "Exit to Desktop");
	
#func _exit_tree():
	#accessible = AccessibleFactory.clear(accessible);

