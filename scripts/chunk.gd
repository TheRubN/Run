extends Spatial


signal spawn_chunk

export var chunk_size = 160
var spawn_depth: float = 330 # Distance pour laquelle un nouveau chunk est instancié (sup au fog stp)
var can_spawn: bool = true
onready var SpawnNext: Position3D = get_child(0) # Position de spawn pour le prochain chunk


func _ready():
	var err = connect("spawn_chunk", get_parent(), "_on_chunk_spawn_chunk")
	if err: print(err)
	
	# On evite que les premiers chunks spawnent un autre chunk
	if can_spawn and SpawnNext.global_translation.z > -spawn_depth:
		can_spawn = false
		
		print("switched initial spawn status")
		#visible = false


func _process(delta):
	# Déplacement
	translate(delta * get_parent().scenery_speed * Vector3.BACK)
	
	# Gestion de spawn du prochain chunk
	if can_spawn and SpawnNext.global_translation.z >= -spawn_depth:
		can_spawn = not can_spawn
		emit_signal("spawn_chunk", -SpawnNext.global_translation.z)
		
		#print("spawn new chunk")
	
	# Gestion de la disparition de ce chunk
	if translation.z >= chunk_size:
		queue_free()
