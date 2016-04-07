require "util"
require "defines"

script.on_event(defines.events.on_tick, function(event)
	if counter == nil then
		counter = 0
	end
	
	if game.player.gui.top.mapCoord == nil then
		game.player.gui.top.add{type="label", name="mapCoord", caption="0, 0"}
	end
		
    if counter % 10 == 0 then
		game.player.gui.top.mapCoord.caption = math.floor(game.player.position["x"]) .. ", " .. math.floor(game.player.position["y"])
		--game.player.print(game.player.surface.name)
		--game.player.print(math.floor(game.player.position["x"]) .. ", " .. math.floor(game.player.position["y"]))
	end
	
	counter = counter + 1
end)