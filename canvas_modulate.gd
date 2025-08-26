extends CanvasModulate

var base_color = Color(1.0,0.858,0.152)
var strength = 0.0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".color = base_color.lerp(Color(1, 1, 1), 1.0 - strength)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	strength = Global.score/5;
	$".".color = base_color.lerp(Color(1, 1, 1), 1.0 - strength)
	pass
