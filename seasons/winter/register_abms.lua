minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
	neighbors = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_objects_count, active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
			minetest.env:add_node( pos, {name="seasons:dirt_with_snow"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_objects_count, active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
			minetest.env:add_node( pos, {name="seasons:dirt"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:sand"},
	neighbors = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_objects_count, active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
			minetest.env:add_node( pos, {name="seasons:sand"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:tree"},	
	interval = 1.0,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
			minetest.env:add_node( pos, {name="seasons:tree"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:leaves"},	
	interval = 1.0,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
			minetest.env:add_node( pos, {name="seasons:leaves"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:water_source"},
	neighbors = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
		if minetest.env:get_node_or_nil(pos) ~= nil then
	minetest.env:add_node( pos, {name="seasons:ice"})
		end
	end
})

minetest.register_abm({
	nodenames = {"seasons:snowflakes"},
	interval = .1,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
	belowpos= {x = pos.x, y = pos.y - 1, z = pos.z}
	below=minetest.env:get_node(belowpos)

			if below.name == "air" then
				minetest.env:remove_node(pos)
				minetest.env:add_node( belowpos, {name="seasons:snowflakes"})
			else
				minetest.env:remove_node(pos)
			end
	end
})
