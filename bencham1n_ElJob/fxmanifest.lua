fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'bencham1n'
description 'Easy eletrician job'
version '1.1'
repository 'https://github.com/bencham1n/-----'

files {
    'locales/*.json'
  }
  
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
server_scripts {
    'server.lua'
}
client_scripts {
    'client.lua'
}

dependency 'mx_fixwiring'