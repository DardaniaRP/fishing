

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('turtlebait', function(source)
    local _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('fishingrod').count > 0 then
        TriggerClientEvent('fishing:setbait', _source, "fishbait")
        
        xPlayer.removeInventoryItem('turtlebait', 1)
        TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle bait onto your fishing rod")
    else
        TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
    end
end)

ESX.RegisterUsableItem('fishbait', function(source)
    local _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('fishingrod').count > 0 then
        TriggerClientEvent('fishing:setbait', _source, "fish")
        
        if xPlayer.getInventoryItem('fishbait').count > 0 then
            xPlayer.removeInventoryItem('fishbait', 1)
            TriggerClientEvent('fishing:message', _source, "~g~You attach the fish bait onto your fishing rod")
        else
            TriggerClientEvent('fishing:message', _source, "~r~You dont have fishbait")
        end
    else
        TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
    end
end)

-- Add the missing 'end' here

ESX.RegisterUsableItem('turtle', function(source)
    local _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem('fishingrod').count > 0 then
        TriggerClientEvent('fishing:setbait', _source, "shark")
        
        xPlayer.removeInventoryItem('turtle', 1)
        TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle meat onto the fishing rod")
    else
        TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
    end
end)
ESX.RegisterUsableItem('fishingrod', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local hasFishingBait = false

    for _, item in pairs(xPlayer.inventory) do
        if item.name == 'fishbait' and item.count > 0 then
            hasFishingBait = true
            break
        end
    end

    if hasFishingBait then
        TriggerClientEvent('fishing:fishstart', _source)
	
	
    else
 
        TriggerClientEvent('esx:showNotification', _source, '~y~ You don\'t have any fishing bait.')
    end
end)




				
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	
	_source = source
	local weight = 2
	local rnd = math.random(1,100)
	xPlayer = ESX.GetPlayerFromId(_source)
	if bait == "turtle" then
		if rnd >= 78 then
			if rnd >= 94 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
				TriggerClientEvent('fishing:break', _source)
				xPlayer.removeInventoryItem('fishingrod', 1)
			else
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('turtle').count > 4 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more turtles")
				else
					TriggerClientEvent('fishing:message', _source, "~g~You caught a turtle\n~r~These are endangered species and are illegal to posses")
					xPlayer.addInventoryItem('fish_bass', 1)
					xPlayer.removeInventoryItem('fishbait', 1)
				end
			end
		else
			if rnd >= 75 then
				if xPlayer.getInventoryItem('catfish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,1)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('catfish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
				end
				
			else
				if xPlayer.getInventoryItem('catfish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,2)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('catfish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('catfish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,2)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('catfish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
				end
				
			else
				if xPlayer.getInventoryItem('catfish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,2)
					TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('catfish', weight)
					xPlayer.removeInventoryItem('fishbait', 1)
				end
			end
		end
		if bait == "none" then
			
			if rnd >= 70 then
			TriggerClientEvent('fishing:message', _source, "~y~You are currently fishing without any equipped bait")
				if  xPlayer.getInventoryItem('fish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					else
						weight = math.random(1,2)
						TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('catfish', weight)
						xPlayer.removeInventoryItem('fishbait', 1)
					end
					
				else
				TriggerClientEvent('fishing:message', _source, "~y~You are currently fishing without any equipped bait")
					if xPlayer.getInventoryItem('catfish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
					else
						weight = math.random(1,2)
						TriggerClientEvent('fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('catfish', weight)
						xPlayer.removeInventoryItem('fishbait', 1)
					end
				end
		end
		if bait == "fishbait" then
			if rnd >= 82 then
			
						if rnd >= 9 then
							TriggerClientEvent('fishing:setbait', _source, "none")
							TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
							TriggerClientEvent('fishing:break', _source)
							xPlayer.removeInventoryItem('fishingrod', 1)
						else
							if xPlayer.getInventoryItem('shark').count > 0  then
									TriggerClientEvent('fishing:setbait', _source, "none")
									TriggerClientEvent('fishing:message', _source, "~r~You cant hold more sharks")
							else
									TriggerClientEvent('fishing:message', _source, "~g~You caught a shark!\n~r~These are endangered species and are illegal to posses")
									TriggerClientEvent('fishing:spawnPed', _source)
									xPlayer.addInventoryItem('shark', 1)
									xPlayer.removeInventoryItem('fishbait', 1)
							end
						end	
							else
									if xPlayer.getInventoryItem('fish').count > 100 then
										TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
									else
										weight = math.random(1,2)
										TriggerClientEvent('fishing:message', _source, "~g~You caught a Cat Fish: ~y~~h~" .. weight .. "kg")
										xPlayer.addInventoryItem('catfish', weight)
										xPlayer.removeInventoryItem('fishbait', 1)
									end
								
							end
			end
			
		end
	
	
end)

RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(money)
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(item)

	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			if item == "fish" then
					local FishQuantity = xPlayer.getInventoryItem('fish').count
						if FishQuantity <= 4 then
						TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ fish')			
					else   
						xPlayer.removeInventoryItem('fish', 5)
						local payment = Config.FishPrice.a
						payment = math.random(Config.FishPrice.a, Config.FishPrice.b) 
						xPlayer.addMoney(payment)
						
						
			end
				

				

				
			end
			if item == "turtle" then
				local FishQuantity = xPlayer.getInventoryItem('turtle').count

				if FishQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ turtles')			
				else   
					xPlayer.removeInventoryItem('turtle', 1)
					local payment = Config.TurtlePrice.a
					payment = math.random(Config.TurtlePrice.a, Config.TurtlePrice.b) 
					xPlayer.addAccountMoney('black_money', payment)
					
					
				end
			end
			if item == "shark" then
				local FishQuantity = xPlayer.getInventoryItem('shark').count

				if FishQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough~s~ sharks')			
				else   
					xPlayer.removeInventoryItem('shark', 1)
					local payment = Config.SharkPrice.a
					payment = math.random(Config.SharkPrice.a, Config.SharkPrice.b)
					xPlayer.addAccountMoney('black_money', payment)
					
					
				end
			end
			
	
end)

