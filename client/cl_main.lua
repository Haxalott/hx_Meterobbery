cooldown = false

local ox_target = exports.ox_target
exports.ox_target:addModel(Config.TargetOptions.Models,
    {
        label = Lang['target_label'],
        icon = Config.TargetOptions.Options.Icon,
        event = 'hx_Meterobbery:client:rob'
    }
)

RegisterNetEvent('hx_Meterobbery:client:rob', function()
    hasItem = exports.ox_inventory:GetItemCount(Config.Item)

    if hasItem == 0 then
        notify(Lang['noti_title'], Lang['item_missing'], 'error')
        return
    end

    if cooldown then
        notify(Lang['noti_title'], Lang['on_cooldown'], 'error')
        return
    end

    if cooldown == false and hasItem >= 1 then
        local success = lib.skillCheck({'easy', 'medium', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'e'})
        if success then
            cooldown = true
            progBar(Lang['prog_bar'], 'machinic_loop_mechandplayer', 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', Config.Time)
            TriggerServerEvent('hx_Meterobbery:server:AddItem')
            Wait(Config.CooldownTime * 1000)
        else
            notify(Lang['noti_title'], Lang['failed_noti'], 'error')
            TriggerServerEvent('hx_Meterobbery:server:RemoveItem')
            alertPolice()
        end
    end
end)
