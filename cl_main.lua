ESX = exports["es_extended"]:getSharedObject()
local ox_target = exports.ox_target
local cooldown  = false

--exports.ox_target:addModel('prop_parknmeter_01', {
--    options = {
--        {
--            name = 'hx_MeterRobbery',
--            event = 'hx_MeterRoberry:client:rob',
--            icon = 'fa-solid fa-sack-dollar',
--            label = 'Rob Parking Meter'
--        }
--    }
--})

exports.ox_target:addModel(Config.ParkingMeterModel, {label = Config.Lang['target_label'], icon = Config.TargetIcon, event = 'hx_MeterRobbery:client:rob'})
exports.ox_target:addModel(Config.ParkingMeterModel2, {label = Config.Lang['target_label'], icon = Config.TargetIcon, event = 'hx_MeterRobbery:client:rob'})

RegisterNetEvent('hx_MeterRobbery:client:rob', function()
  local itemCount = exports.ox_inventory:GetItemCount(Config.Item, item)
  if itemCount == 0 then
    lib.notify({
      title       = Config.Lang['notify_title'],
      description = Config.Lang['missing_description'],
      type        = 'error',
      position    = Config.NotifyPos
    })
    return
  end

  if cooldown then
      lib.notify({
          title       = Config.Lang['notify_title'],
          description = Config.Lang['cooldown_true'],
          type        = 'error',
          position    = Config.NotifyPos
      })
      return
  end

  if cooldown == false and itemCount >= 1 then
  local success = lib.skillCheck({'medium', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'e'})
  if success == true then
      lib.progressCircle({
          label        = 'Robbing Meter...',
          duration     = 5000,
          position     = 'bottom',
          useWhileDead = false,
          canCancel    = false,
          disable      = {
              move     = true,
              car      = true,
          },
          anim = {
              dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
              clip = 'machinic_loop_mechandplayer'
          },
      }) TriggerServerEvent('hx_MeterRobbery:server:addItem')
      cooldown = true
      TriggerEvent('hx_MeterRobbery:client:cooldownRemove')
  else
      TriggerServerEvent('hx_MeterRobbery:server:removeItem')
      local data = exports['cd_dispatch']:GetPlayerInfo()
      TriggerServerEvent('cd_dispatch:AddNotification', {
          job_table = {'police', }, 
          coords    = data.coords,
          title     = Config.Lang['dispatch_title'],
          message   = 'A '..data.sex..' robbing a parking meter at '..data.street, 
          flash     = 0,
          unique_id = data.unique_id,
          sound     = 1,
          blip = {
              sprite  = Config.DispatchBlip.sprite, 
              scale   = Config.DispatchBlip.scale, 
              colour  = Config.DispatchBlip.colour,
              flashes = Config.DispatchBlip.flashes, 
              text    = Config.DispatchBlip.text,
              time    = Config.DispatchBlip.time,
              radius  = Config.DispatchBlip.radius,
           }
        })
        end
    end
end)

RegisterNetEvent('hx_MeterRobbery:client:cooldownRemove', function()
    Wait(Config.CooldownTime)
    cooldown = false
    if Config.NotifyOnCooldownEnd then
        lib.notify({
            title       = Config.Lang['notify_title'],
            description = Config.Lang['cooldown_end'],
            type        = 'inform',
            position    = Config.NotifyPos,
            icon        = 'sack-dollar'
        })
    else
        return
    end
end)
