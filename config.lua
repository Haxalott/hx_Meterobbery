Config = {}

Config.Notify = 'ox_lib' -- ox_lib, brutal_notify, mythic_notify, okokNotify, custom
Config.NotifyIcon = 'sack-dollar' -- Only For Ox_Lib
Config.NotifyPos = 'top-center' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left' ONLY FOR OX_LIB
Config.Item = 'screwdriver'
Config.ProgBar = 'circle' -- circle, and bar
Config.Time = 2500 -- amount of time it takes to rob
Config.ProgBarPos = 'bottom' -- bottom, middle (ONLY FOR CIRCLE PROGBAR)
Config.Reward = 'black_money' -- black_money, money
Config.MinReward = 100
Config.MaxReward = 1000
Config.Webhook = 'https://discord.com/api/webhooks/1234750995800653865/vYbdGIOo6sunkxf2QYHEIKPAe-xJ4oicnVZAgAt-6t7zEAZ3vqPBCdv79daCA0Fn_SdD'

Config.NotifyOnCooldownEnd = true -- Whether or not it notify's the player when their cooldown ends
Config.CooldownTime = 60 -- Time in seconds



Config.TargetOptions = {
    Models = {
        'prop_parknmeter_01', -- which props it puts the target on
        'prop_parknmeter_02' -- which props it puts the target on
    },
    Options = {
        Icon = 'fa-solid fa-sack-dollar' -- The icon of the target
    },
}

Config.Dispatch = {
    Blip = {
        sprite  = 761,
        scale   = 1.2,
        colour  = 3,
        flashes = false,
        text    = 'Meter Robbery',
        time    = 5,
        radius  = 0,
    },
    DispatchSettings = {
        DispatchEnabled = true,
        Dispatch        = 'cd_dispatch' -- 
    },
}