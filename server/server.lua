local QRCore = exports['qr-core']:GetCoreObject()

-- give reward
RegisterServerEvent('rsg-rhodesbankheist:server:reward')
AddEventHandler('rsg-rhodesbankheist:server:reward', function()
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	local chance = math.random(1,100)
	if chance <= 50 then
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item3], "add")
		TriggerClientEvent('QRCore:Notify', src, 'small loot reward this time!', 'primary')
	elseif chance >= 50 and chance <= 80 then -- medium reward
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item3], "add")
		TriggerClientEvent('QRCore:Notify', src, 'medium loot reward this time!', 'primary')
	elseif chance > 80 then -- large reward
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item3], "add")
		Player.Functions.AddMoney(Config.MoneyRewardType, Config.MoneyRewardAmount, "bank-heist")
		TriggerClientEvent('QRCore:Notify', src, 'large loot reward this time!', 'primary')
		Wait(5000)
		TriggerClientEvent('QRCore:Notify', src, 'addtional '..Config.MoneyRewardAmount..' '..Config.MoneyRewardType..' looted!', 'primary')
	end
end)

-- remove item
RegisterNetEvent('rsg-rhodesbankheist:server:removeItem', function(item, amount)
	local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item], "remove")
end)
