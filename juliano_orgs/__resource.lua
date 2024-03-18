fx_version 'adamant'
game 'gta5'

repository 'https://github.com/julianorei/juliano_orgs'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

autor "julianorei#9410"
description 'Sistema de Organizações do Juliano Utilizado no Summer RP ;)'

version '0.1.0'

server_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  '@mysql-async/lib/MySQL.lua',
  'configcrips.lua',
  'server/maincrips.lua',
  'configlosvagos.lua',
  'server/mainlosvagos.lua',
  'configballas.lua',
  'server/mainballas.lua',
  'configcosanostra.lua',
  'server/maincosanostra.lua',
  'configanarchy.lua',
  'server/mainanarchy.lua',
  'configcayo.lua',
  'server/maincayo.lua',
  'configyakuza.lua',
  'server/mainyakuza.lua',
  'configvanilla.lua',
  'server/mainvanilla.lua',
  'configyellowjack.lua',
  'server/mainyellowjack.lua',
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  'configcrips.lua',
  'client/maincrips.lua',
  'configlosvagos.lua',
  'client/mainlosvagos.lua',
  'configballas.lua',
  'client/mainballas.lua',
  'configcosanostra.lua',
  'client/maincosanostra.lua',
  'configanarchy.lua',
  'client/mainanarchy.lua',
  'configcayo.lua',
  'client/maincayo.lua',
  'configyakuza.lua',
  'client/mainyakuza.lua',
  'configvanilla.lua',
  'client/mainvanilla.lua',
  'configyellowjack.lua',
  'client/mainyellowjack.lua',

}
