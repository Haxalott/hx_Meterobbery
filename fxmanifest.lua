fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Haxalott'
description 'Rob parking meters'

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}