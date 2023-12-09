ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0

local bait = "none"
			
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(function()
while true do
	Wait(600)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
end
end)
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if fishing then

			if not pause then
	            SetTextFont(0)
	            SetTextProportional(0)
	            SetTextScale(0.4, 0.4)
	            SetTextDropShadow(0, 0, 0, 0,255)
	            SetTextEdge(1, 0, 0, 0, 255)
	            SetTextDropShadow()
	            SetTextOutline()
	            SetTextCentre(1)
	            SetTextEntry("STRING")
	            AddTextComponentString("Press ~y~E~s~ to stop fishing")
		        DrawText(0.5, 0.94)
	        end

			if IsControlJustReleased(0, Keys['W']) then
				 input = 1
			end
			if IsControlJustReleased(0, Keys['S']) then
				input = 2
			end
			if IsControlJustReleased(0, Keys['D']) then
				input = 3
			end
			if IsControlJustReleased(0, Keys['G']) then
				input = 4
			end
			
			if IsControlJustReleased(0, Keys['E']) then
				fishing = false
				ClearPedTasks(GetPlayerPed(-1))
			end	
			
			if pausetimer > math.random(8, 15) then
				input = 99
			end
			
			
			if IsControlJustReleased(0, Keys['E']) then
				fishing = false
				--ESX.ShowNotification("~r~Started Fishing")
			end
			if fishing then
			
				playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	if not IsPedInAnyVehicle(playerPed) then
					
				else
					fishing = false
					ESX.ShowNotification("~y~Started Fishing")
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					ESX.ShowNotification("~y~Started Fishing")
				end
			end
			
			
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerServerEvent('fishing:catch', bait)
				else
					ESX.ShowNotification("~o~Fish got free")
				end
			end
		end

		
		
		--if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SellFish.x, Config.SellFish.y, Config.SellFish.z, true) <= 3 then
		--	TriggerServerEvent('fishing:startSelling', "fish")
		--	Citizen.Wait(4000)
		--end
		--if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SellShark.x, Config.SellShark.y, Config.SellShark.z, true) <= 3 then
		--	TriggerServerEvent('fishing:startSelling', "shark")
		--	Citizen.Wait(4000)
		--end
		--if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SellTurtle.x, Config.SellTurtle.y, Config.SellTurtle.z, true) <= 3 then
		--	TriggerServerEvent('fishing:startSelling', "turtle")
		--	Citizen.Wait(4000)
		--end
		
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = math.random(10, 30) * 1000
		Wait(wait)
			if fishing then
				pause = true
				correct = math.random(1,2)
				input = 0
				pausetimer = 0

				local key = 0

				if correct == 1 then
					key = string.format("W")
				elseif correct == 2 then
					key = string.format("S")
				elseif correct == 3 then
					key = string.format("D")
				elseif correct == 4 then
					key = string.format("G")
				end

				while pause do
					Citizen.Wait(0)
					SetTextFont(0)
		            SetTextProportional(0)
		            SetTextScale(0.4, 0.4)
		            SetTextDropShadow(0, 0, 0, 0,255)
		            SetTextEdge(1, 0, 0, 0, 255)
		            SetTextDropShadow()
		            SetTextOutline()
		            SetTextCentre(1)
		            SetTextEntry("STRING")
		            AddTextComponentString('Press ~y~'.. key .. '~s~ to reel in your catch')
		            DrawText(0.5, 0.94)
		        end
			end
			
	end
end)

RegisterNetEvent('fishing:message')
AddEventHandler('fishing:message', function(message)
	ESX.ShowNotification(message)
end)
RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	fishing = false
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('fishing:spawnPed')
AddEventHandler('fishing:spawnPed', function()
	
	RequestModel( GetHashKey( "A_C_SharkTiger" ) )
		while ( not HasModelLoaded( GetHashKey( "A_C_SharkTiger" ) ) ) do
			Citizen.Wait( 1 )
		end
	local pos = GetEntityCoords(GetPlayerPed(-1))
	
	local ped = CreatePed(29, 0x06C3F072, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(bool)
	bait = bool
	--print(bait)
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()
	playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	if not IsPedInAnyVehicle(playerPed) then
		if GetWaterHeight(pos.x, pos.y, pos.z, pos.z - 3.0) and not IsPedSwimming(GetPlayerPed(-1)) then
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
		else
			ESX.ShowNotification("~y~Must be near open water to start fishing")
		end
	end
end, false)