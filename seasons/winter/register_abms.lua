function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end


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
	nodenames = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
		if minetest.env:get_node({x = pos.x, y = pos.y-1, z = pos.z}).name == "air" then
		minetest.env:remove_node(pos)
		minetest.env:add_node({x = pos.x, y = pos.y -1, z = pos.z}, {name= "seasons:snowflakes"})
		end
	end
})

minetest.register_abm({
	nodenames = {"seasons:snowflakes"},
	interval = 1.0,
	chance = 1,
	action = function(pos,node,active_objects_count,active_objects_count_wider)
		if minetest.env:get_node({x = pos.x, y = pos.y-1, z = pos.z}).name ~= "air" then
		minetest.env:remove_node(pos)
		end
	end
})

