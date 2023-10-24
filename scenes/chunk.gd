extends Spatial


export var scenery_speed: float = 10
var obstacle_scene = preload("res://scenes/obstacles/obstacle1.tscn")

signal spawn_chunk


func _ready():
	var obstacle = obstacle_scene.instance()
	add_child(obstacle)


func _process(delta):
	if translation.z >= get_child(0).scale.z:
		emit_signal("spawn_chunk")
		queue_free()
	translate(delta * scenery_speed * Vector3.BACK)
