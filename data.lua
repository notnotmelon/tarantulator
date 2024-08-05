local function merge(prototype, new_data)
	prototype = table.deepcopy(prototype)
	for k, v in pairs(new_data) do
		prototype[k] = v
	end
	return prototype
end

local leg_hit_the_ground_trigger = {{
	offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
	repeat_count = 4,
	smoke_name = 'smoke-building',
	speed_from_center = 0.03,
	starting_frame_deviation = 5,
	starting_frame_speed_deviation = 5,
	type = 'create-trivial-smoke',
}}

data:extend{
	{
		type = 'item',
		name = 'tarantulator-reactor',
		flags = {'hidden', 'not-stackable', 'only-in-cursor'},
		icon = '__tarantulator__/graphics/icon/nothing.png',
		icon_size = 1,
		stack_size = 1,
	},
	{
		name = 'tarantulator-reactor',
		type = 'generator-equipment',
		power = '1W',
		categories = {'tarantulator'},
		shape = {
			type = 'full',
			width = 4,
			height = 4,
		},
		energy_source = {
			usage_priority = 'secondary-input',
			type = 'electric',
		},
		sprite = {
			filename = '__tarantulator__/graphics/equipment/reactor.png',
			size = {128, 128},
		},
	},
	merge(data.raw['spider-vehicle']['spidertron'], {
		name = 'tarantulator',
		minimap_representation = {
			filename = '__tarantulator__/graphics/entity/tarantulator/tarantulator-map.png',
			flags = {'icon'},
			scale = 0.75,
			size = {128, 128}
		},
		equipment_grid = 'tarantulator-equipment-grid',
		torso_rotation_speed = 0.0035,
		automatic_weapon_cycling = false,
		chunk_exploration_radius = 4,
		chain_shooting_cooldown_modifier = 0.4,
		collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
		burner = {
			type = 'burner',
			fuel_inventory_size = 2,
			burnt_inventory_size = 1,
			fuel_category = 'nuclear',
			effectivity = 0.5
		},
		height = 2.25,
		inventory_size = 100,
		max_health = 5000,
		minable = {
			mining_time = 2,
			result = 'tarantulator'
		},
		movement_energy_consumption = '60MW',
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		guns = {
			'spidertron-rocket-launcher-1',
			'spidertron-rocket-launcher-2',
			'spidertron-rocket-launcher-3',
			'spidertron-rocket-launcher-4',
			'tarantulator-sniper-rifle',
		},
		spider_engine = {
			legs = {
				{
					blocking_legs = {2},
					ground_position = {3.375 * 1.5, -3.75},
					leg = 'tarantulator-leg',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {0.46875 * 1.5, -0.6875 * 1.5},
				},
				{
					blocking_legs = {1, 3},
					ground_position = {3.5, -1.25},
					leg = 'tarantulator-leg-small',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {0.71875 * 1.5, -0.3125 * 1.5},
				},
				{
					blocking_legs = {2, 4},
					ground_position = {3.5, 1.25},
					leg = 'tarantulator-leg-small',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {0.78125 * 1.5, 0.125 * 1.5},
				},
				{
					blocking_legs = {3},
					ground_position = {3.375 * 1.5, 3.75},
					leg = 'tarantulator-leg',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {0.46875 * 1.5, 0.53125 * 1.5},
				},
				{
					blocking_legs = {6},
					ground_position = {-3.375 * 1.5, -3.75},
					leg = 'tarantulator-leg',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {-0.46875 * 1.5, -0.6875 * 1.5},
				},
				{
					blocking_legs = {5, 7},
					ground_position = {-3.5, -1.25},
					leg = 'tarantulator-leg-small',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {-0.71875 * 1.5, -0.3125 * 1.5},
				},
				{
					blocking_legs = {6, 8},
					ground_position = {-3.5, 1.25},
					leg = 'tarantulator-leg-small',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {-0.78125 * 1.5, 0.125 * 1.5},
				},
				{
					blocking_legs = {7},
					ground_position = {-3.375 * 1.5, 3.75},
					leg = 'tarantulator-leg',
					leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
					mount_position = {-0.46875 * 1.5, 0.53125 * 1.5},
				},
			},
			military_target = 'spidertron-military-target',
			resistances = {
				{
					decrease = 15,
					percent = 60,
					type = 'fire'
				},
				{
					decrease = 15,
					percent = 60,
					type = 'physical'
				},
				{
					decrease = 50,
					percent = 80,
					type = 'impact'
				},
				{
					decrease = 0,
					percent = 100,
					type = 'explosion'
				},
				{
					decrease = 0,
					percent = 70,
					type = 'acid'
				},
				{
					decrease = 0,
					percent = 70,
					type = 'laser'
				},
				{
					decrease = 0,
					percent = 70,
					type = 'electric'
				},
			},
		},
	}),
	merge(data.raw['item-with-entity-data']['spidertron'], {
		order = 'b[personal-transport]-c[spidertron]-a[tarantulator]',
		name = 'tarantulator',
		place_result = 'tarantulator',
		icon = '__tarantulator__/graphics/icon/tarantulator.png',
	}),
	{
		name = 'tarantulator-equipment-grid',
		type = 'equipment-grid',
		height = 8,
		width = 10,
		equipment_categories = {'tarantulator'},
	},
	{
		name = 'tarantulator',
		type = 'equipment-category',
	},
	merge(data.raw['spider-leg']['spidertron-leg-1'], {
		name = 'tarantulator-leg',
		part_length = 7
	}),
	merge(data.raw['spider-leg']['spidertron-leg-1'], {
		name = 'tarantulator-leg-small',
		part_length = 2.5,
		initial_movement_speed = 0,
		movement_acceleration = 0.002,
		join_turn_offset = 0.375
	}),
	{
		type = 'gun',
		name = 'tarantulator-sniper-rifle',
		icon = '__base__/graphics/icons/tank-cannon.png',
		icon_size = 64, icon_mipmaps = 4,
		flags = {'hidden', 'not-stackable'},
		stack_size = 1,
		attack_parameters = {
			type = 'projectile',
			range = 50,
			min_attack_distance = 10,
			cooldown = 140,
			health_penalty = -1000,
			ammo_category = 'tarantulator-ammo',
			sound = {
				{
					filename = '__tarantulator__/sound/big-gun.ogg',
					volume = 4,
					audible_distance_modifier = 10,
				}
			},
			projectile_creation_distance = 1.125
		},
	},
	{
		name = 'tarantulator-ammo',
		type = 'ammo-category',
	},
	{
		type = 'ammo',
		name = 'tarantulator-rifle-round',
		subgroup = 'ammo',
		icon = '__tarantulator__/graphics/icon/laser-ammo.png',
		icon_size = 64, icon_mipmaps = 4,
		flags = nil,
		order = 'd[explosive-cannon-shell]-d[tarantulator]',
		stack_size = 100,
		magazine_size = 1,
		reload_time = 0,
		ammo_type = {
			category = 'tarantulator-ammo',
			action = {
				source_effects = {
					entity_name = 'tarantulator-beam',
					type = 'create-explosion',
					offsets = {{-0.5, 2}},
				},
				action_delivery = {
					target_effects = {
						{
							entity_name = 'big-explosion',
							type = 'create-entity',
						},
						{
							damage = {
								amount = 4000,
								type = 'physical',
							},
							type = 'damage',
						},
					},
					type = 'instant',
				},
				type = 'line',
				range = 200,
				width = 2,
			},
		}
	},
	{
		type = 'recipe',
		name = 'tarantulator',
		ingredients = {
			{'nuclear-reactor', 1},
			{'spidertron', 1},
			{'electric-engine-unit', 200},
			{'processing-unit', 400},
			{'satellite', 2},
			{'uranium-fuel-cell', 20},
			{'low-density-structure', 50},
		},
		energy_required = 20,
		result = 'tarantulator',
		enabled = false,
	},
	{
		type = 'recipe',
		name = 'tarantulator-rifle-round',
		ingredients = {
			{'uranium-rounds-magazine', 6},
			{'cluster-grenade', 1},
		},
		energy_required = 20,
		results = {{'tarantulator-rifle-round', 6}},
		enabled = false,
	},
	{
		type = 'technology',
		name = 'tarantulator',
		icon = '__tarantulator__/graphics/technology/tarantulator.png',
		icon_size = 128,
		effects = {
			{
				recipe = 'tarantulator',
				type = 'unlock-recipe'
			},
			{
				recipe = 'tarantulator-rifle-round',
				type = 'unlock-recipe'
			}
		},
		prerequisites = {
			'spidertron',
			'space-science-pack',
			'artillery',
			'nuclear-power',
		},
		unit = {
			count = 4000,
			ingredients = {
				{'automation-science-pack', 1},
				{'logistic-science-pack', 1},
				{'military-science-pack', 1},
				{'chemical-science-pack', 1},
				{'production-science-pack', 1},
				{'utility-science-pack', 1},
				{'space-science-pack', 1},
			},
			time = 30,
		},
	},
	{
		type = 'explosion',
		name = 'tarantulator-beam',
		light = {
			color = {0.3, 1, 0.3},
			intensity = 1,
			size = 10,
		},
		animations = {{
			filename = '__tarantulator__/graphics/entity/blue-beam.png',
			frame_count = 6,
			height = 1,
			priority = 'extra-high',
			width = 187,
			animation_speed = 0.5,
			tint = {0.3, 1, 0.3},
		}},
		smoke = 'smoke-fast',
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		subgroup = 'explosions',
		rotate = true,
		beam = true
	}
}

if mods.bobenemies then
	table.insert(data.raw['spider-vehicle']['tarantulator'].resistances, {type = 'plasma', decrease = 6, percent = 50})
	table.insert(data.raw['spider-vehicle']['tarantulator'].resistances, {type = 'bob-pierce', decrease = 6, percent = 50})
end

data.raw['spider-vehicle']['tarantulator'].graphics_set.light[1] = {
	color = {0.3, 1, 0.3},
	intensity = 0.6,
	minimum_darkness = 0.3,
	size = 25
}

data.raw['spider-vehicle']['tarantulator'].energy_source = nil

data.raw['spider-vehicle']['tarantulator'].graphics_set.animation = {layers = {
	{
		direction_count = 64,
		filename = '__tarantulator__/graphics/entity/tarantulator/torso/tarantulator-body.png',
		height = 105,
		hr_version = {
			direction_count = 64,
			filename = '__tarantulator__/graphics/entity/tarantulator/torso/hr-tarantulator-body.png',
			height = 207,
			line_length = 8,
			scale = 0.5,
			shift = {0, -0.59375},
			width = 198,
		},
		line_length = 8,
		shift = {0, -0.59375},
		width = 99,
	},
	{
		apply_runtime_tint = true,
		direction_count = 64,
		filename = '__tarantulator__/graphics/entity/tarantulator/torso/tarantulator-body-mask.png',
		width = 99,
		hr_version = {
			apply_runtime_tint = true,
			direction_count = 64,
			filename = '__tarantulator__/graphics/entity/tarantulator/torso/hr-tarantulator-body-mask.png',
			width = 195,
			line_length = 8,
			scale = 0.5,
			shift = {0, -0.4375},
			height = 150,
		},
		line_length = 8,
		shift = {0, -0.4375},
		height = 75,
	},
}}

data.raw['spider-vehicle']['tarantulator'].graphics_set.base_animation = {layers = {
	{
		direction_count = 1,
		filename = '__tarantulator__/graphics/entity/tarantulator/torso/tarantulator-body-bottom.png',
		width = 95,
		hr_version = {
			direction_count = 1,
			filename = '__tarantulator__/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom.png',
			width = 189,
			line_length = 1,
			scale = 0.5,
			shift = {0, 1},
			height = 242,
		},
		line_length = 1,
		shift = {0, 1},
		height = 121,
	},
	{
		apply_runtime_tint = true,
		direction_count = 1,
		filename = '__tarantulator__/graphics/entity/tarantulator/torso/tarantulator-body-bottom-mask.png',
		width = 93,
		hr_version = {
			apply_runtime_tint = true,
			direction_count = 1,
			filename = '__tarantulator__/graphics/entity/tarantulator/torso/hr-tarantulator-body-bottom-mask.png',
			width = 186,
			line_length = 1,
			scale = 0.5,
			shift = {0, 0.109375},
			height = 135,
		},
		line_length = 1,
		shift = {0, 0.125},
		height = 68,
	},
}}
