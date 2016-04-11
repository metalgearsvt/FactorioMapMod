require "util"
require "defines"

script.on_event(defines.events.on_tick, function(event)
	
	counter = game.tick
	
	if game.player.gui.top.mapCoord == nil then
		game.player.gui.top.add{type="label", name="mapCoord", caption="0, 0"}
		game.player.gui.left.add{type="label", name="tileName", caption="Tile: "}
	end
		
	if counter % 10 == 0 then
		printCoord()
		checkItem()
		--game.player.print(game.player.surface.name)
		--game.player.print(math.floor(game.player.position["x"]) .. ", " .. math.floor(game.player.position["y"]))
	end

end)

function printCoord()
	game.player.gui.top.mapCoord.caption = math.floor(game.player.position["x"]) .. ", " .. math.floor(game.player.position["y"]) .. " Tick: " .. game.tick
end

function checkItem()

	entityName = game.surfaces["nauvis"].find_entities{{math.floor(game.player.position["x"]), math.floor(game.player.position["y"])}, {math.floor(game.player.position["x"]) + 1, math.floor(game.player.position["y"]) + 1}}
	
	if entityName then
		if entityName[2] then
			enName = entityName[2].name
		else
			enName = ""
		end
		game.player.gui.left.tileName.caption = " Tile: " .. game.surfaces["nauvis"].get_tile(game.player.position["x"], game.player.position["y"]).name .. " --- Entity: " .. enName
		game.write_file("test.txt", enName, true)
	end

end
