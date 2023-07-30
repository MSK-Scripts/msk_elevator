fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_elevater'
description 'MSK Elevator'
version '1.0'

lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'config.lua'
}

client_script {
	'client.lua'
}

dependencies {
	'es_extended',
	'ox_lib'
}