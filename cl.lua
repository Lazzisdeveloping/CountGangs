ESX = nil
ingang = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	
	while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

	ESX.PlayerData = ESX.GetPlayerData()
	Wait(5000)
	for i = 1, #Config.Gangs, 1 do
		if ESX.PlayerData.job.name == Config.Gangs[i] then
			ingang = true
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterCommand('countgangs', function()
    if ingang then
        TriggerServerEvent('countgangs:gangs')
    else
        ESX.ShowNotification('~r~Kuules äpärä et oo ees jengissä!')
    end
end)