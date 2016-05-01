-- External Command (external_cmd) mod by Menche
-- Allows server commands / chat from outside minetest
-- License: LGPL

local admin = minetest.setting_get("name")

if admin == nil then
	admin = "SERVER"
end

minetest.register_globalstep(
	function(dtime)
		local f = (io.open(minetest.get_worldpath("external_cmd").."/message", "r"))
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
					local success, output = cmd_def.func(admin, param)
					local o = (io.open(minetest.get_worldpath("external_cmd").."/output", "w"))
					o:write(output)
					o:close()
				else
					minetest.chat_send_all(admin..": "..message)
				end
			end
		end
	end
)
