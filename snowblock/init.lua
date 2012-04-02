minetest.register_node("minecraft:snowblock", {
	description = "Snow",
	tile_images = {"minecraft_snowblock.png"},
	is_ground_content = true,
	groups = {crumbly=3, cracky=2,oddly_breakable_by_hand=3},
	drop ='craft "minecraft:snowball" 4',
})
