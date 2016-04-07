require "util"
require "defines"

script.on_event(defines.events.on_tick, function(event)
	game.player.print(game.player.surface.name)
	game.player.print(game.player.position["x"] .. ", " .. game.player.position["y"])
end)