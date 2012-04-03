function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

local snowflakes = {
	"seasons:snowflakes"
}

local snow_gen = function( minp, maxp )
	for c, snow in ipairs(snowflakes) do
		local amount = math.random( 0,25 )
		for a = 0, amount do
			local pos = {
				x = math.random( minp.x, maxp.x ),
				y = math.random( minp.y, maxp.y ),
				z = math.random( minp.z, maxp.z ),
			}
			for i = -1, 1 do
				for j = -1, 1 do
					for k = -1, 1 do
						if math.random() > 0.2 then
						else
							local p = { x=pos.x+i, y=pos.y+j, z=pos.z+k }
							local n = minetest.env:get_node( p )
							if n.name == "air" then
								minetest.env:add_node( p,{name= "seasons:snowflakes"} )
							end
						end
					end
				end
			end
		end
	end
end

minetest.register_on_generated( snow_gen )
