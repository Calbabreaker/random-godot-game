extends Node2D

var building_prefab := preload("res://scenes/building.tscn")
onready var offset: Vector2 = ($"BuildingGrid").position - BuildingWorld.SIZE_VECTOR / 2

var selected_building := "Simple Generator"
var antimatter := 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_click"):
		var offseted_mouse_pos = get_local_mouse_position() - offset
		var mouse_cell_pos = (offseted_mouse_pos / BuildingWorld.SIZE).floor()
		Manager.create_building(mouse_cell_pos, selected_building)
		
func _on_Button_pressed() -> void:
	Manager.timestep()
