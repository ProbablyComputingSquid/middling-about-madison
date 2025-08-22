extends Area2D

@onready var sfx = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	

func _on_body_entered(body):
	print("registered collision")
	if body.is_in_group("player"):
		print("player collision")
		sfx.play();
		hide();
		await sfx.finished;
		queue_free();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
