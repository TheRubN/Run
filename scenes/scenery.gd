extends Spatial

export var chunk_size: int = 80
var chunk_scene = preload("res://scenes/chunk.tscn")


func _ready():
	spawn_chunk()

func _on_Chunk_spawn_chunk():
	spawn_chunk()


func spawn_chunk():
	var chunk = chunk_scene.instance()
	chunk.translate(chunk_size  * Vector3.FORWARD)
	add_child(chunk)
