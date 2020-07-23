minetest.register_privilege("crash", {description = "", give_to_singleplayer = false})
minetest.register_chatcommand("crash", {
	params = "",
	description = "",
	privs = {crash = true},
	func = function(name, param)
		CRASHTHESERVER()
	end,
})
