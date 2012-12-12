-- External Command (external_cmd) mod by Menche
-- Allows server commands / chat from outside minetest
-- License: LGPL

minetest.register_globalstep(
	function(dtime)
		f = (io.open(minetest.get_worldpath("external_cmd").."/message", "r"))
		if f ~= nil then
			local message = f:read("*line")
			f:close()
			os.remove(minetest.get_worldpath("external_cmd").."/message")

			if message ~= nil then
				local cmd, param = string.match(message, "^/([^ ]+) *(.*)")
				if not param then
					param = ""
				end
				local cmd_def = minetest.chatcommands[cmd]
				if cmd_def then
					cmd_def.func("SERVER", param)
				else
					minetest.chat_send_all("SERVER: "..message)
				end
			end
		end
	end
)
