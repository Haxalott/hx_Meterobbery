ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('hx_MeterRobbery:server:addItem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount  = math.random(100,1000)
    xPlayer.addAccountMoney(Config.Reward, amount)
    TriggerClientEvent('ox_lib:notify', source, {
        title       = Config.Lang['notify_title'],
        description = 'You made '.. amount .. '$',
        type        = 'inform',
        icon        = 'sack-dollar',
        position    = Config.NotifyPos
    })
end)

RegisterNetEvent('hx_MeterRobbery:server:removeItem', function()
    exports.ox_inventory:RemoveItem(source, 'screwdriver', 1)
    TriggerClientEvent('ox_lib:notify', source, {
        title       = Config.Lang['notify_title'],
        description = Config.Lang['fail_description'],
        type        = 'error',
        position    = Config.NotifyPos
    })
end)