ESX = exports['es_extended']:getSharedObject()


lib.locale()

local inwork = false
local alreadyinwork = false
local coords = Config.Eletrician.pedCoords
local heading = Config.Eletrician.pedHeading
local reward = 0
local addreward = Config.rewardel.classic
local claimed = false
local model = Config.Eletrician.pedModel
local numberofbrigade = 0
local clientfdonebrigade = 0



local function LoadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end



local blipCoords = Config.blip.coords


Citizen.CreateThread(function()
    
    local blip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)
    local sprite = Config.blip.sprite
    local colour = Config.blip.sprite
    local goofydistance = Config.blip.distance
    local scaleblip = Config.blip.size

    
    SetBlipSprite(blip, sprite)  
    SetBlipColour(blip, colour)  
    SetBlipScale(blip, scaleblip)  
    SetBlipAsShortRange(blip, goofydistance)  
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(locale("benc_spritelocal"))  
    EndTextCommandSetBlipName(blip)  

   
end)


CreateThread(function()
    LoadModel(model) 

   
    local npc = CreatePed(4, model, coords.x, coords.y, coords.z, heading, false, false)

    
    SetEntityInvincible(npc, true) 
    SetBlockingOfNonTemporaryEvents(npc, true) 
    FreezeEntityPosition(npc, true) 

   
    local options = {
        {
            name = "talk_with_npcbenjamin",
            label = locale("bchs_talks1"),
            icon = "fa-solid fa-comment",
            event = "startNpcInteraction", 
            distance = 2.0 
        }
    }
    
    exports.ox_target:addLocalEntity(npc, options)

    
    SetModelAsNoLongerNeeded(model)
end)


lib.registerContext({
    id = 'becham1n:elmenu123',
    title = locale("title_bechaminEL"),
    options = {
      {
        title = locale("bencham1n_startJob"),
        icon = 'box',
        onSelect = function()
            if alreadyinwork  == true then
                notify(locale("bos_inwork1"), locale("already_inwork_yapity123"), 3000, "error")
            end
            if  inwork == false then
                SpawnVehicle()
                notify(locale("bos_inwork1"), locale("benkosfixNotify"), 3000, "success")
                alreadyinwork = true
                inwork = true
                claimed = false
                numberofbrigade = 0
                clientfdonebrigade = 0
                clientreward = 0
                

                if inwork == true then
                    checkwork()
                end
            end
        end
    },
    {
        title = locale("bend_job1"),
        icon = 'box',
        onSelect = function()
            if inwork == true then
            notify(locale("bos_inwork1"), locale("ended_jobbecnh"), 3000, "success")
            inwork = false
            alreadyinwork = false
            
        else  inwork = false
            notify(locale("bos_inwork1"), locale("not_in_dutysaso"), 3000, "error")
            
        end
    end
    },
    {
        title = locale("bchs_claimrewardis"),
        icon = 'box',
        onSelect = function()
            rewardclaimed()
            if reward == 0 then
                notify(locale("bos_inwork1"), locale("bchs_0rewardD"), reward, 3000, "error")
            else
            notify(locale("bos_inwork1"), locale("bchs_notifclaimrewardis"), reward, 3000, "error")
            rewardtrigger()
            end
            claimed = true
        end
    }
}
})

function rewardtrigger()
    TriggerServerEvent("bencham1n:GetReward","BCH1Brrsda3", cache.serverId, "money", reward, numberofbrigade,Config.Eletrician.pedCoords)
end
--------------------------------------------------------------------------------





----





RegisterNetEvent("bch:continuemenucko", function()
    local response = lib.alertDialog({
        header = "Boss",
        content = locale("bench_continue"),
        centered = true,
        cancel = true,
        size = "sm",
        labels = {
            cancel = locale("bencham1n_dontcontinuemenu"),
            confirm = locale("bencham1n_doyouwantcontinue"), 
        }
    })
    
    if response == "confirm" then
        continuework()
    else
        local location = Config.Eletrician.pedCoords
        SetNewWaypoint(location.x, location.y)
        notify(locale("bos_inwork1"), locale("bencham1n_finishedoption"), 3000, "info")
    end
end)
---


function rewardclaimed()
    if claimed == true then
        reward = 0
    end
end

function checkwork()
    Citizen.Wait(Config.WaitTime)  
    if  inwork == true then
    notify(locale("bos_inwork1"), locale("first_clientbenajmin"), 3000, "success")
    SetWaypointForPlayer()
end
end

function GetRandomLocation()
    local randomIndex = math.random(1, #Config.Locations)
    return Config.Locations[randomIndex]
end


function SetWaypointForPlayer()
    local location = GetRandomLocation()
    SetNewWaypoint(location.x, location.y)
    exports.ox_target:addSphereZone({
        coords = location,
        name = "bencham1n:electircjobox",
        radius = 3,
        options = {
            {
                label = locale("bench_fix"),
                name = "benchamin_semafor:fix",
                icon = "fa-solid fa-wrench",
                distance = 3,
                onSelect = function()
                    TriggerEvent("Mx::StartMinigameElectricCircuit", '50%', '50%', '2.0', '30vmin', '1.ogg', function()
                        if done then
                            done = done
                        else
                            done = 1
                        end
                        notify(locale("bos_inwork1"), locale("bchs_doneworkbe"), 3000, "success")
                        exports.ox_target:removeZone("bencham1n:electircjobox")
                        reward = reward+addreward
                        numberofbrigade = numberofbrigade +1
                        clientfdonebrigade = clientfdonebrigade + 1
                        TriggerEvent('bch:continuemenucko')

                end)
                end
            }
        }
    })
end
----------
RegisterNetEvent('bch:elclientspawn', function ()
    local suradnice =  Config.npc.clientcoord
    local skin = "a_m_m_prolhost_01"
    LoadModel(skin) 

   
    local npc = CreatePed(4, skin, suradnice.x, suradnice.y, suradnice.z, heading, false, false)

    
    SetEntityInvincible(npc, true) 
    SetBlockingOfNonTemporaryEvents(npc, true) 
    FreezeEntityPosition(npc, true) 

   
    exports.ox_target:addSphereZone({
        coords = suradnice,
        name = "bencham1n:realclient",
        radius = 3,
        options = {
            {
                label = locale("bchs_talk2withclient"),
                name = "benchamin_clientik:talk",
                icon = "fa-solid fa-wrench",
                distance = 3,
                onSelect = function()
                    TriggerEvent('helpClientInteraction')
                    TriggerEvent("playNPCAnim")
                end
            }
        }
    })
    
    SetModelAsNoLongerNeeded(model)
end)

RegisterNetEvent('helpClientInteraction', function()
    local success = lib.progressBar({
        duration = 2000,
        label = locale("bchs_talkingprogressbar"),
        useWhileDead = false,
        canCancel = true,
        disable = { car = true },
        anim = {
            dict = 'special_ped@baygor@monologue_3@monologue_3c',
            clip = 'trees_can_talk_2'
        }
    })

    
    if success then
        notify(locale("bos_inwork1"), locale("bchel_succprogress"), 3000, "info")
        exports.ox_target:removeZone("bencham1n:realclient")
        clientminigamexd1()
    else
        notify(locale("bos_inwork1"), locale("bchel_stoppedprogress"), 3000, "error") 
    end
end)

function clientminigamexd1()
    exports.ox_target:addSphereZone({
        coords = Config.npc.repaircoordsclient,
        name = "bencham1n:realclientminigamecoords",
        radius = 3,
        options = {
            {
                label = locale("bench_fix"),
                name = "benchamin_clientik:minigamestart",
                icon = "fa-solid fa-wrench",
                distance = 3,
                onSelect = function()
                    TriggerEvent("Mx::StartMinigameElectricCircuit", '50%', '50%', '2.0', '30vmin', '1.ogg', function()
                        if done then
                            done = done
                        else
                            done = 1
                        end
                        notify(locale("bos_inwork1"), locale("bchs_doneworkbe"), 3000, "success")
                        exports.ox_target:removeZone("bencham1n:realclientminigamecoords")
                        addoldcoordsclient()
                        clientfdonebrigade = 0
                        reward = reward+addreward
                        numberofbrigade = numberofbrigade +1
                    end)
                end
            }
        }
    })
end
local suradnice =  Config.npc.clientcoord
function addoldcoordsclient()
    exports.ox_target:addSphereZone({
        coords = suradnice,
        name = "bencham1n:getclientreward",
        radius = 3,
        options = {
            {
                label = locale("bos_takereward"),
                name = "benchamin_clientik:clientreward34",
                icon = "fa-solid fa-wrench",
                distance = 3,
                onSelect = function()
                        notify(locale("bos_inwork1"), locale("bchs_doneworkbe"), 3000, "success")
                        exports.ox_target:removeZone("bencham1n:getclientreward")
                        TriggerEvent('bch:continuemenucko')
                end
                }
            }
        })
end
    
                    
function continuework()
    if clientfdonebrigade == Config.npc.number then
        local suradnice =  Config.npc.clientcoord
        Citizen.Wait(Config.npc.waittime)
        notify(locale("bos_inwork1"), locale("bos_firstnpcclientxd2"), 3000, "success")
TriggerEvent('bch:elclientspawn')
SetNewWaypoint(suradnice.x, suradnice.y)
    else
    notify(locale("bos_inwork1"), locale("bchs_contunuingwork"), 3000, "success")
    Citizen.Wait(Config.WaitTime)
    notify(locale("bos_inwork1"), locale("first_clientbenajmin"), 3000, "success")
    SetWaypointForPlayer()
    end
end

RegisterNetEvent("startNpcInteraction", function()
    lib.showContext("becham1n:elmenu123")
end)


function notify(title, message, time, type)
    if Config.NotifyType == "ox" then
        lib.notify({
            title = title,
            description = message,
            duration = time,
            type = type
        })
    elseif Config.NotifyType == "esx" then
        ESX.ShowNotification(title, message, type, time)
    elseif Config.NotifyType == "okok" then
        exports['okokNotify']:Alert(title, message, time, type, true)
    elseif Config.NotifyType == "custom" then
        print("custom") -- change this to custom
    end
end


function SpawnVehicle()
    local playerPed = PlayerPedId()
    local spawnLoc = Config.Eletrician.carspawnloc
    local vehicleName = Config.Eletrician.carmodel  

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end
    
    local vehicle = CreateVehicle(vehicleName, spawnLoc.x, spawnLoc.y, spawnLoc.z, 0.0, true, false)

    SetVehicleNumberPlateText(vehicle, "ELEC_" .. math.random(1000, 9999))
end

function PlayNPCAnimation(npc, dict, anim, duration)
    if not DoesEntityExist(npc) then return end

    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end

   
    TaskPlayAnim(npc, dict, anim, 8.0, 8.0, duration, 1, 0, false, false, false)
end
