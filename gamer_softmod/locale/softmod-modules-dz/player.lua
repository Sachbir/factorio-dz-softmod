-- Player Soft Mod
-- Changes spawn items from vanilla version
-- @author Denis Zholob (DDDGamer)
-- github: https://github.com/DDDGamer/factorio-dz-softmod
-- ======================================================= --

-- Give player starting items.
-- @param event on_player_joined event
function player_created(event)
  local player = game.players[event.player_index]
  player.insert { name = "iron-axe",            count = 1  }
  player.insert { name = "pistol",              count = 1  }
  player.insert { name = "firearm-magazine",    count = 10 }
  player.insert { name = "stone-furnace",       count = 1  }
  player.insert { name = "burner-mining-drill", count = 2  }
  player.insert { name = "wooden-chest",        count = 1  }
  player.insert { name = "iron-plate",          count = 10 }
  reveal_area(player)
end

-- Give player weapons after they respawn.
-- @param event on_player_respawned event
function player_respawned(event)
  local player = game.players[event.player_index]
  player.insert { name = "iron-axe",         count = 1 }
  player.insert { name = "pistol",           count = 1 }
  player.insert { name = "firearm-magazine", count = 10 }
end

-- Reveal area around the player
-- @param player 
function reveal_area(player)
  player.force.chart(player.surface, {
    {player.position.x - 200, player.position.y - 200},
    {player.position.x + 200, player.position.y + 200}
  })
end


-- Register Events
Event.register(defines.events.on_player_created, player_created)
Event.register(defines.events.on_player_respawned, player_respawned)
