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
