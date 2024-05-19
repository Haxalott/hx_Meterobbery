RegisterNetEvent('hx_Meterobbery:server:AddItem', function()
    local itemCheck = exports.ox_inventory:GetItemCount(source, Config.Item)
    if itemCheck >= 1 then
        local amount = math.random(Config.MinReward, Config.MaxReward)
        exports.ox_inventory:AddItem(source, 'black_money', amount)
        notify('Meter Robbery', 'You made '.. amount ..'$', 'inform')

        local Identifier = GetPlayerIdentifierByType(source, 'discord')
        local name       = GetPlayerName(source)
        sendWebhook(16777215, 'Meter Robbery Logs', "**Player Name:** `"..name.."`\n **Discord ID:** `"..Identifier.."`\n **Amount:** "..amount..'')
    end
end)

RegisterNetEvent('hx_Meterobbery:server:RemoveItem', function()
    exports.ox_inventory:RemoveItem(source, Config.Item, 1)
end)