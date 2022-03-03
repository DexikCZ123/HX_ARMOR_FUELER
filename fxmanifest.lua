-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Dexik'
description 'Armour Fueler Script Create by Dexik For HexusRP'
version '0.1'

-- What to run
client_scripts {
    '@es_extended/locale.lua',
    'client.lua',
    'config.lua',
    'locales/cs.lua',
    'locales/en.lua',
} 

dependencies {
    'mythic_progbar', --- https://github.com/HalCroves/mythic_progbar
    'es_extended', --- Nedeed     ESX.ShowFloatingHelpNotification
}