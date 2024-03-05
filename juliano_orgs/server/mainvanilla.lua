ESX = exports["es_extended"]:getSharedObject()
if Configvanilla.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'vanilla', Configvanilla.MaxInService)
end

-- TriggerEvent('esx_phone:registerNumber', 'vanilla', _U('alert_vanilla'), true, true)
TriggerEvent('esx_society:registerSociety', 'vanilla', 'vanilla', 'society_vanilla', 'society_vanilla', 'society_vanilla', {type = 'public'})

RegisterServerEvent('esx_vanillajob:giveWeapon')
AddEventHandler('esx_vanillajob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_vanillajob:confiscatePlayerItem')
AddEventHandler('esx_vanillajob:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label

    targetXPlayer.removeInventoryItem(itemName, amount)
    sourceXPlayer.addInventoryItem(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

  end

end)

RegisterServerEvent('esx_vanillajob:handcuff')
AddEventHandler('esx_vanillajob:handcuff', function(target)
  TriggerClientEvent('esx_vanillajob:handcuff', target)
end)

RegisterServerEvent('esx_vanillajob:drag')
AddEventHandler('esx_vanillajob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_vanillajob:drag', target, _source)
end)

RegisterServerEvent('esx_vanillajob:putInVehicle')
AddEventHandler('esx_vanillajob:putInVehicle', function(target)
  TriggerClientEvent('esx_vanillajob:putInVehicle', target)
end)

RegisterServerEvent('esx_vanillajob:OutVehicle')
AddEventHandler('esx_vanillajob:OutVehicle', function(target)
    TriggerClientEvent('esx_vanillajob:OutVehicle', target)
end)

RegisterServerEvent('esx_vanillajob:getStockItem')
AddEventHandler('esx_vanillajob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

    for k,v in ipairs(GetPlayerIdentifiers(source))do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
      identifier = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
      license = v
      elseif string.sub(v, 1, string.len("live:")) == "live:" then
      liveid = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
      xblid  = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
      discord = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
      playerip = v
      end
  end
  local string = discord
  --string = string:gsub("discord:","") 
  local mensage = 'O jogador ' ..xPlayer.name.. ' retirou ' .. count..'x ' ..itemName
  sendToDiscord(mensage)


  end)

end)

RegisterServerEvent('esx_vanillajob:putStockItems')
AddEventHandler('esx_vanillajob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then



      
      inventory.addItem()





    end

   -- TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

    


  end)

end)

ESX.RegisterServerCallback('esx_vanillajob:getOtherPlayerData', function(source, cb, target)

  if Configvanilla.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " Inches"

    local data = {
      name        = GetPlayerName(target),
      job         = xPlayer.job,
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }

    TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Configvanilla.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', source, function(licenses)
        data.licenses = licenses
        cb(data)
      end)

    else
      cb(data)
    end

  else

    local xPlayer = ESX.GetPlayerFromId(target)

    local data = {
      name       = GetPlayerName(target),
      job        = xPlayer.job,
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_vanillajob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types_vanilla WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_vanillajob:getVehicleInfos', function(source, cb, plate)

  if Configvanilla.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

ESX.RegisterServerCallback('esx_vanillajob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_vanilla', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_vanillajob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)


  for k,v in ipairs(GetPlayerIdentifiers(source))do
    if string.sub(v, 1, string.len("steam:")) == "steam:" then
    identifier = v
    elseif string.sub(v, 1, string.len("license:")) == "license:" then
    license = v
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
    liveid = v
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
    xblid  = v
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
    discord = v
    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
    playerip = v
    end
end
local string = discord
--string = string:gsub("discord:","") 
local mensage = 'O jogador ' ..xPlayer.name.. ' depositou uma ' ..weaponName
sendToDiscord(mensage)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_vanilla', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_vanillajob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  
  for k,v in ipairs(GetPlayerIdentifiers(source))do
    if string.sub(v, 1, string.len("steam:")) == "steam:" then
    identifier = v
    elseif string.sub(v, 1, string.len("license:")) == "license:" then
    license = v
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
    liveid = v
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
    xblid  = v
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
    discord = v
    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
    playerip = v
    end
end
local string = discord
--string = string:gsub("discord:","") 
local mensage = 'O jogador ' ..xPlayer.name.. ' retirou uma ' ..weaponName
sendToDiscord(mensage)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_vanilla', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_vanillajob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vanilla', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_vanillajob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vanilla', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_vanillajob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)