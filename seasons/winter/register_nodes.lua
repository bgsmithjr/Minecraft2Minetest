
minetest.register_node("seasons:dirt_with_snow", {
	description = "Snow",
	tile_images = {"winter_snow.png", "winter_dirt.png", "winter_dirt.png^winter_snow_side.png"},
	is_ground_content = true,
	groups = {crumbly=2, cracky=3,oddly_breakable_by_hand=1},
	drop ="seasons:snowblock",
})

minetest.register_node("seasons:ice", {
	description = "Ice",
	tile_images = {"winter_ice.png"},
	is_ground_content = true,
	groups = {crumbly=1, cracky=2,oddly_breakable_by_hand=0.5},
})

minetest.register_node("seasons:dirt", {
	description = "Frozen Dirt",
	tile_images = {"winter_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=2, cracky=3,oddly_breakable_by_hand=1},
})

minetest.register_node("seasons:snowblock", {
	description = "Snow Block",
	tile_images = {"winter_snow.png"},
	is_ground_content = true,
	groups = {crumbly=2, cracky=3,oddly_breakable_by_hand=1},
})

minetest.register_node("seasons:sand", {
	description = "Frozen Sand",
	tile_images = {"winter_sand.png"},
	is_ground_content = true,
	groups = {crumbly=2, cracky=3,oddly_breakable_by_hand=1},
})

minetest.register_node("seasons:snowflakes",{
	drawtype = "plantlike",
	tile_images = {"winter_snowflakes.png"},
	is_ground_content = false,
	paramtype = "light",
	walkable = false,
})

minetest.register_node("seasons:tree", {
	description = "Dead Tree",
	tile_images = {"winter_tree_top.png", "winter_tree_top.png", "winter_tree.png"},
	is_ground_content = true,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

minetest.register_node("seasons:leaves", {
	description = "Dead Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tile_images = {"winter_leaves.png", "winter_leaves.png"},
	paramtype = "light",
	groups = {snappy=3},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'seasons:leaves'},
			}
		}
	},
})
