extends Spatial


export var chunk_size: float = 80
var chunk0_scene = preload("res://scenes/chunks/chunk0.tscn")
var chunk1_scene = preload("res://scenes/chunks/chunk1.tscn")
var chunks_scenes: Array = [chunk0_scene, chunk1_scene]


func _ready():
	var initial_chunk_scene = chunks_scenes[0]
	var initial_chunk = initial_chunk_scene.instance()
	# On spawn les premiers chunks
	spawn_chunk(0, 0)
	spawn_chunk(initial_chunk.chunk_size, 0)
	spawn_chunk(initial_chunk.chunk_size * 2, 0)


func _on_chunk_spawn_chunk(z_pos: float):
	spawn_chunk(z_pos)


func spawn_chunk(z_pos: float, i: int = randi() % 2):
	var chunk_scene = chunks_scenes[i]
	var chunk = chunk_scene.instance()
	chunk.translate(z_pos  * Vector3.FORWARD) # Pour que le chunk spawn devant le joueur
	add_child(chunk)
