extends Spatial


var scenery_speed: float = 50
var chunk0_scene: PackedScene = preload("res://scenes/chunks/chunk0.tscn")
var chunk1_scene: PackedScene = preload("res://scenes/chunks/chunk1.tscn")
var chunks_scenes: Array = [chunk0_scene, chunk1_scene]


func _ready():
	# On spawn les premiers chunks
	var initial_chunk_scene = chunks_scenes[0]
	var initial_chunk = initial_chunk_scene.instance()
	spawn_chunk(0, 0)
	spawn_chunk(initial_chunk.chunk_size, 0)
	spawn_chunk(initial_chunk.chunk_size * 2, 0)


func _process(delta):
	scenery_speed += delta # Augmentation de la vitesse au cours du temps
	# Déplacement de toute la scène vers l'arrière (marche pas en fait)
	#for child in get_children():
	#	translate(delta * scenery_speed * Vector3.BACK)


func _on_chunk_spawn_chunk(z_pos: float):
	spawn_chunk(z_pos)


func spawn_chunk(z_pos: float, i: int = randi() % 2):
	var chunk_scene: PackedScene = chunks_scenes[i]
	var chunk: Spatial = chunk_scene.instance()
	chunk.translate(z_pos  * Vector3.FORWARD) # Pour que le chunk spawn devant le joueur
	add_child(chunk)
	
	print(scenery_speed)
