-- External Command (external_cmd) mod by Menche
-- Allows server commands / chat from outside minetest
-- License: LGPL

minetest.register_globalstep(
	function(dtime)
		f = (io.open(minetest.get_modpath("external_cmd").."/message", "r"))
		if f ~= nil then
			local line = f:read("*line")
			if line ~= nil then
				minetest.chat_send_all("SERVER: "..line)
			end
			f:close()
			os.remove(minetest.get_modpath("external_cmd").."/message")
		end
	end
)
