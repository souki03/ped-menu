local f = false

function openpedmenu()
    f = true

    SetNuiFocus(1, 1)
    SendNUIMessage({
        type = "ui",
        status = true,
    })
end

RegisterKeyMapping('+pedmenu', 'Open Ped Menu', 'keyboard', 'F1')

RegisterCommand('+pedmenu', function()
    if not f then
        openpedmenu()
    else
        closepedmenu()
    end
end, false)

function closepedmenu()
    f = false

    SetNuiFocus(0, 0)
    SendNUIMessage({
        type = "ui",
        status = false,
    })
end

RegisterNUICallback("exit", function(data)
    closepedmenu()
end)

RegisterNUICallback("spawn", function(data, cb)
    closepedmenu()
    local model = data.ped
    
    local j1 = PlayerId()
    local p1 = model

    --print(p1)
        RequestModel(p1)
            while not HasModelLoaded(p1) do
                Wait(100)
            end
        SetPlayerModel(j1, p1)
        SetModelAsNoLongerNeeded(p1)
end)