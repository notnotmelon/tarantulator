global.tarantulators = {}

for _, surface in pairs(game.surfaces) do
	for _, spider in pairs(surface.find_entities_filtered{name = 'tarantulator'}) do
		global.tarantulators[spider.unit_number] = spider
	end
end