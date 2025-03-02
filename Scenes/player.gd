extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $Sprit

var is_moving = false

func _physics_process(delta: float) -> void:
	if is_moving == false:
		return
	if global_position == sprite_2d.global_position:
		is_moving = false
		return
	
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 1)

func _process(delta: float) -> void:
	if is_moving:
		return
	
	if Input.is_action_pressed('ui_up'):
		Move(Vector2.UP)
	elif Input.is_action_pressed('ui_right'):
		Move(Vector2.RIGHT)
	elif Input.is_action_pressed('ui_down'):
		Move(Vector2.DOWN)
	elif Input.is_action_pressed('ui_left'):
		Move(Vector2.LEFT)

func Move(direction: Vector2):
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y,
	)
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	if tile_data.get_custom_data("walkable") == false:
		return
	
	is_moving = true
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)

func _input(event: InputEvent) -> void:
	var tre = Vector2i(2, 0)
	if Input.is_action_pressed("ui_accept"):
		tile_map.set_cell(0, tile_map.local_to_map(global_position), 0, tre, 0)
