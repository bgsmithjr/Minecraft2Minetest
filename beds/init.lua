dofile(minetest.get_modpath("beds").."/sleeping.lua")
minetest.register_node( 'beds:blue', {
	description         = 'Bed',
	drawtype	    = "chestlike",
	tile_images         = {
				'beds_blue_top_above.png',
				'beds_blue_top_above.png',
				'beds_tt_inv.png',
				'beds_bb_inv.png',
				'beds_ts2_inv.png',
				'beds_ts_inv.png',
			      },
	groups		    = { choppy = 3, oddly_breakable_by_hand = 1.5}
})

minetest.register_craft( {
	output              = 'beds:blue',
	recipe = {
		{ 'default:wood', 'default:wood', 'default:wood' },
		{ 'default:stick','', 'default:stick' },
	},
})

minetest.register_craft({
	type = 'fuel',
	recipe = 'beds:blue',
	burntime = 45,
})

minetest.register_node( "beds:blue_top", {
	Description         = '',
	tile_images         = {
				'beds_blue_top_above.png',
				'beds_blue_top_above.png',
				'beds_blue_top_top.png',
				'beds_blue_bottom_bottom.png',
				'beds_blue_top_side2.png',
				'beds_blue_top_side.png',
			      },
	paramtype           = 'facedir',
	walkable            = true,
	groups		    = { choppy = 3, oddly_breakable_by_hand = 1.5},
	drop                = 'beds:blue',

})

minetest.register_node( 'beds:blue_bottom', {
	Description         = '',
	drawtype	    = "chestlike",
	tile_images         = {
				'beds_blue_bottom_above.png',
				'beds_blue_bottom_above.png',
				'beds_blue_bottom_bottom.png',
				'beds_blue_bottom_bottom.png',
				'beds_blue_bottom_side2.png',
				'beds_blue_bottom_side.png',
			      },
	paramtype           = 'facedir',
	walkable            = true,
	groups		    = { choppy = 3, oddly_breakable_by_hand = 1.5},
	drop                = 'beds:blue',
})
--------------------------------------------------------------------------------
local round = function( n )
	if n >= 0 then
		return math.floor( n + 0.5 )
	else
		return math.ceil( n - 0.5 )
	end
end

minetest.register_on_placenode(function( pos, node, placer )
	if node.name ~= 'beds:blue' then return end
	rpos = { x = pos.x - 1, y = pos.y , z = pos.z }
	lpos = { x = pos.x + 1, y = pos.y , z = pos.z }
	right = minetest.env:get_node( rpos )
	left = minetest.env:get_node( lpos )
	dir = placer:get_look_dir()
	dir = placer:get_look_dir()

	if     round( dir.x ) == 1  then
		newparam = WALLMX
	elseif round( dir.x ) == -1 then
		newparam = WALLPX
	elseif round( dir.z ) == 1  then
		newparam = WALLMZ
	elseif round( dir.z ) == -1 then
		newparam = WALLPZ
	end

	if right.name == 'air' then
		minetest.env:add_node( pos,  { name = 'beds:blue_top', param1 = newparam} )
		minetest.env:add_node( rpos, { name = 'beds:blue_bottom' ,param1 = newparam} )
	elseif left.name == 'air' then
		minetest.env:add_node( pos,  { name = 'beds:blue_bottom' ,param1 = newparam} )
		minetest.env:add_node( lpos, { name = 'beds:blue_top' ,param1 = newparam} )
	else
		minetest.env:remove_node( pos )
		placer:get_inventory():add_item( "main", 'beds:blue' )
		minetest.chat_send_player( placer:get_player_name(), 'not enough space' )
	end
end)

minetest.register_on_dignode(function( pos, node, digger )
	rpos = { x = pos.x - 1, y = pos.y , z = pos.z }
	lpos = { x = pos.x + 1, y = pos.y , z = pos.z }

	if ( node.name == 'beds:blue_top' ) then
		minetest.env:remove_node( rpos )
	elseif ( node.name == 'beds:blue_bottom' ) then
		minetest.env:remove_node( lpos )
	end
end)

