ESX                           = nil
local PlayerData = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10000)
	end

	PlayerData = ESX.GetPlayerData()
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
end)


Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local armor = GetPedArmour(player)
        local sleep = 500

        if PlayerData.job ~= nil and PlayerData.job.name == Config.job or PlayerData.job ~= nil and PlayerData.job.name == Config.job2 then 
            for k,v in pairs(Config.Zone) do
                local distance = #(playerCoords - v)
                if distance <= 3 then
                    sleep = 0
                    ESX.ShowFloatingHelpNotification(_U('press'),vector3(v))
                    if distance <= 1.5 and IsControlPressed(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "vest-wearing",
                            duration = 10000,
                            label = _U('armor_wearing'),
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "clothingshirt",
                                anim = "try_shirt_positive_d",
                            },
                        }, function(status)
                            if not status then
                                if armor >= Config.ArmorAmount then
                                    ESX.ShowNotification(_U('armor_max'))
                                else
                                    SetPedArmour(player, Config.ArmorAmount)
                                end
                            end
                        end)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)



