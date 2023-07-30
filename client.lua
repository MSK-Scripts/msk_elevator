CreateThread(function()
    while true do
        local sleep = 200
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(Config.Elevators) do
            local text3d, marker, neededJob = v.text3d, v.marker, v.jobs

            for _, location in pairs(v.locations) do
                local dist = #(playerCoords - vec3(location.coords.x, location.coords.y, location.coords.z))
                
                if dist <= marker.distance and (not neededJob.enable or (neededJob.enable and Table_Contains(neededJob.jobs, ESX.PlayerData.job.name))) then
                    sleep = 0

                    DrawM(marker, text3d, location.coords)

                    if dist <= 2.0 then
                        if IsControlJustPressed(0, 38) then
                            registerMenu(v.locations)
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

registerMenu = function(locations)
    local options = {}

    for k, v in pairs(locations) do
        table.insert(options, {label = v.label, args = {coords = v.coords, isVehicleAllowed = v.isVehicleAllowed}})
    end

    lib.registerMenu({
        id = 'msk_elevator',
        title = 'Elevator',
        position = 'top-left',
        options = options
    }, function(selected, scrollIndex, args)
        teleport(args.coords, args.isVehicleAllowed)
    end)

    lib.showMenu('msk_elevator')
end

teleport = function(coords, isVehicleAllowed)
    local canTeleport, isInVehicle = false, false
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, 0) and isVehicleAllowed then
        local vehicle = GetVehiclePedIsIn(playerPed, 0)

        if GetPedInVehicleSeat(vehicle, -1) == playerPed then 
            isInVehicle = vehicle
            canTeleport = true 
        end
    elseif IsPedInAnyVehicle(playerPed, 0) and not isVehicleAllowed then
        canTeleport = false
        ESX.ShowNotification('Dein Fahrzeug dort keinen Platz!')
    else
        canTeleport = true
    end

    if not canTeleport then return end

    DoScreenFadeOut(100)
    Wait(750)

    if isInVehicle then 
        ESX.Game.Teleport(isInVehicle, {x = coords.x, y = coords.y, z = coords.z, heading = coords.w})
    else
        ESX.Game.Teleport(playerPed, {x = coords.x, y = coords.y, z = coords.z, heading = coords.w})
    end

    DoScreenFadeIn(100)
end

DrawM = function(marker, text, coords)
    if text.enable then ESX.Game.Utils.DrawText3D(coords, text.text, text.size) end
	if marker.enable then DrawMarker(marker.type, coords.x, coords.y, coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.size.a, marker.size.b, marker.size.c, marker.color.a, marker.color.b, marker.color.c, 100, false, true, 0, false) end
end

Table_Contains = function(table, value)
    for k, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end