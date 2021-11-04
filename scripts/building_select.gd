extends Button

var current_building_name: String
onready var description_label: RichTextLabel = $"Description" 

func set_building(name: String):
	var building = Manager.building_data[name]
	description_label.text = building.description
	text = name
	current_building_name = name

func set_random_building():
	var rand_num = randi() % Manager.building_names.size()
	var building_name = Manager.building_names[rand_num]
	set_building(building_name)

func _on_BuildingSelect_pressed() -> void:
	Manager.select_building(current_building_name)
