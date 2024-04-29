Config = {}

Config.Reward        = 'black_money' -- black_money and money (money = clean, black_money = Dirty Money)
Config.NotifyPos     = 'top-center' -- 
Config.MinimumReward = 100
Config.MaxReward     = 1000

Config.TargetIcon          = 'fa-solid fa-sack-dollar'
Config.ParkingMeterModel   = 'prop_parknmeter_01'
Config.ParkingMeterModel2  = 'prop_parknmeter_02'
Config.NotifyOnCooldownEnd = true -- Notify the player when their cooldown ends?
Config.CooldownTime        = 60000 -- Time in milliseconds

Config.Item = 'screwdriver'

Config.DispatchBlip = {
    sprite  = 761,
    scale   = 1.2,
    colour  = 3,
    flashes = false,
    text    = 'Parking Meter Robbery',
    time    = 5,
    radius  = 0,
}

Config.Lang = {
    ['target_label']         = 'Rob Parking Meter',
    ['dispatch_title']       = 'Parking Meter Robbery',
    ['progress_label']       = 'Robbing Meter...',
    ['missing_description']  = 'You need a screwdriver to do this',
    ['notify_title']         = 'Parking Meter Robbery',
    ['fail_description']     = 'You failed the robbery, cops were alerted.' ,
    ['cooldown_true']        = 'You are on cooldown, try again later',
    ['cooldown_end']         = 'You are no longer on cooldown.',
}