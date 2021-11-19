extends BuildingWorld

const particle_prefab := preload("res://scenes/enhancer_particle.tscn")

func on_timestep(cell_pos: Vector2) -> void:
	call_deferred("loop_through_surrounding", funcref(self, "enhance"), cell_pos)

func enhance(building: BuildingWorld, _cell_pos: Vector2):
	if building.antimatter_collect != null: # antimatter was generated:
		var particle = particle_prefab.instance()
		particle.target_collect = building.antimatter_collect
		particle.multiplier = 2.0
		particle.modulate = Color("#dd0000")
		Global.emit_signal("add_particle", particle, self)
	
