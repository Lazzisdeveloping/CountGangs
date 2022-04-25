ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent("countgangs:gangs")
AddEventHandler("countgangs:gangs", function()
	local source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	local gangster = ESX.GetPlayers()
	gang1 = 0
	gang2 = 0
	gang3 = 0
	for i=1, #gangster, 1 do
		local xPlayer = ESX.GetPlayerFromId(gangster[i])
		if xPlayer.job.name == 'yksi' then
            gang1 = gang1 + 1
		end		
		if xPlayer.job.name == 'kaksi' then
			gang2 = gang2 + 1
		end
		if xPlayer.job.name == 'kolme' then
			gang3 = gang3 + 1
        end
	end
	Gangss(source, gang1, gang2, gang3)
end)


function Gangss(source, gang1, gang2, gang3)
	TriggerClientEvent("esx:showNotification", source, "Jengi 1: ~r~"..gang1.."\n~s~Jengi 2: ~r~"..gang2.."\n~s~Jengi 3: ~r~"..gang3)
end