ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("bencham1n:GetReward")
AddEventHandler("bencham1n:GetReward", function(hash, id, item, count,numberofbrigade)
    local xPlayer = ESX.GetPlayerFromId(id)
    local hash = hash
    if hash == "BCH1Brrsda3" then
        exports.ox_inventory:AddItem(id, item, count)
        sendToDiscord(3288624, "Eletrician", "Player "..xPlayer.getName().." Number of done Work:"..numberofbrigade,"Get Money: " ..count, "Bencham1n Logs")
    else
        print("CHEATER!")
        sendToDiscord(3288624, "Eletrician", "Player "..xPlayer.getName().." is cheater", "Bencham1n Logs")
    end
end)

function sendToDiscord(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
  
    PerformHttpRequest(Webhook.Main, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

Webhook = {}

Webhook.Main = "https://discord.com/api/webhooks/1332020879458042020/oKv8FKZRMbLgAxOfzPItnxZjCnxT-CYUw0O_fM6cgTZcLi0w8qfmO1UenWeP9J98WWiX"