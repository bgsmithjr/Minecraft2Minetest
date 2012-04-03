minetest.register_entity(":seasons:snowflakes",{
	physical = true,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	visual = "sprite",
	textures = {"winter_snowflakes.png"},
	on_step = function(self, dtime)
	self.object:setacceleration({x=0, y=-3, z=0})
	local pos = self.object:getpos()
	local bcp = {x=pos.x, y=pos.y-0.7, z=pos.z} -- Position of bottom center point
	local bcn = minetest.env:get_node(bcp)
	if bcn.name ~= "air" then
		local np = {x=bcp.x, y=bcp.y+1, z=bcp.z}
		self.object:remove()
	else
	-- Do nothing
	end
end
})

