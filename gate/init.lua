-- Gate Nodes
----------------------------------------------------------------------------
minetest.register_node("gate:wood_open", {
	description = "Wooden Gate",
	drawtype = "fencelike",
	tile_images = {"default_wood.png"},
	wield_image = "default_fence.png",
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("gate:wood_closed", {
	description = "Wooden Gate",
	drawtype = "fencelike",
	tile_images = {"default_wood.png"},
	wield_image = "default_fence.png",
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
}) 

-- Gate Recipe
----------------------------------------------------------------------------
minetest.register_craft{
	output	=	"gate:wood_closed",
	recipe 	=	{
			{'','',''},
			{"default:stick", "default:stick" , "default:stick"},
			{"default:stick", '', "default:stick"},
			},
}

-- Gate Switch
----------------------------------------------------------------------------
minetest.register_on_punchnode(function(pos, node, puncher)
	left_position = { x = pos.x - 1, y = pos.y, z = pos.z}
	right_position = { x = pos.x + 1, y = pos.y, z = pos.z}
	front_position = { x = pos.x, y = pos.y, z = pos.z - 1}
	behind_position = { x = pos.x, y = pos.y, z = pos.z + 1}
	front_neighbor = minetest.env:get_node(front_position)
	behind_neighbor = minetest.env:get_node(behind_position)
	right_neighbor = minetest.env:get_node(right_position)
	left_neighbor = minetest.env:get_node(left_position)
	open_position = {x = pos.x - 1, y = pos.y, z = pos.z -1}
	close_position = {x = pos.x + 1, y = pos.y, z = pos.z +1}
-- Check if gate is open or closed
if node.name == "gate:wood_closed" then
	-- Check if both neighbors are wooden fence. If they are not end the function so it can be removed
	if (left_neighbor.name == "default:fence_wood" or left_neighbor.name == "gate:wood_closed") and (right_neighbor.name == "default:fence_wood" or right_neighbor.name == "gate:wood_closed") then
		-- Remove the closed gate
		minetest.env:remove_node(pos)
		-- Add the open gate
		minetest.env:add_node(open_position,{name = "gate:wood_open"})
	-- End checking both neighbors
	end
-- If the gate is open
elseif node.name == "gate:wood_open" then
-- Because the fence has changed direction we have to check different neighbors.
	-- Check if ONE neighbor is wooden fence
	if (front_neighbor.name == "default:fence_wood" or 			behind_neighbor.name == "default:fence_wood") then
		-- Remove the open gate
		minetest.env:remove_node(pos)
		-- Add the closed gate
		minetest.env:add_node(close_position,{name = "gate:wood_closed"})
	-- End neighbor check
	end
-- End open or shut check
end
-- End on punch function
end)
