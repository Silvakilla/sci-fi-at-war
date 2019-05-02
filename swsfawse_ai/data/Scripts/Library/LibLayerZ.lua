local libLayerZ = { }

--- Disables a given GameObject.
-- @tparam GameObject gameObject
-- @tparam Boolean spawnsFighters [optional]
function libLayerZ.disableObject(gameObject, spawnsFighters)
    local spawns = false
    if spawnsFighters then
        spawns = spawnsFighters
    end
    --gameObject.Prevent_AI_Usage(true)
    if spawns then
        gameObject.Set_Garrison_Spawn(false)
    end
    gameObject.Make_Invulnerable(true)
    gameObject.Set_Selectable(false)
    gameObject.Prevent_All_Fire(true)
end

--- Enables a given GameObject.
-- @tparam GameObject gameObject
-- @tparam Boolean spawnsFighters [optional]
function libLayerZ.enableObject(gameObject, spawnsFighters)
    local spawns = false
    if spawnsFighters then
        spawns = spawnsFighters
    end
    --gameObject.Prevent_AI_Usage(false)
    if spawns then
        gameObject.Set_Garrison_Spawn(true)
    end
    gameObject.Make_Invulnerable(false)
    gameObject.Set_Selectable(true)
    gameObject.Prevent_All_Fire(false)
end

--- Hides a given game object.
-- It's a wrapper around two consecutive GameObject.Hide(true) calls - don't even ask why we need those.
-- @tparam GameObject gameObject
function libLayerZ.hideObject(gameObject)
    gameObject.Hide(true)
    gameObject.Hide(true)
end

function libLayerZ.setLayerZ(gameObject)
    local layerZObj = Spawn_Unit(Find_Object_Type("LAYER_Z_DUMMY"), gameObject.Get_Position(), gameObject.Get_Owner())
    layerZObj = layerZObj[1]
    local layer = "CORVETTE"
    --place carriers more at the heights of fighters, so their Repair abilities work as intended
    --Height of Fighters is: 75 - 100
    if gameObject.Get_Type().Get_Name() == "IMPERIAL_ESCORT_CARRIER" or
            gameObject.Get_Type().Get_Name() == "IMPERIAL_ESCORT_CARRIER_ADVANCED_LOADOUT" or
            gameObject.Get_Type().Get_Name() == "IMPERIAL_ESCORT_CARRIER_BOMBER_LOADOUT" or
            gameObject.Get_Type().Get_Name() == "IMPERIAL_ESCORT_CARRIER_FIGHTER_LOADOUT" or
            gameObject.Get_Type().Get_Name() == "ALLIANCE_ESCORT_CARRIER" or
            gameObject.Get_Type().Get_Name() == "ALLIANCE_ESCORT_CARRIER_ADVANCED_LOADOUT" or
            gameObject.Get_Type().Get_Name() == "ALLIANCE_ESCORT_CARRIER_NEW_REPUBLIC_LOADOUT" or
            gameObject.Get_Type().Get_Name() == "SOONTIR_FEL_CARRIER" or
            gameObject.Get_Type().Get_Name() == "LTCOMMANDER_CADAA_CARRIER" or
            gameObject.Get_Type().Get_Name() == "HUOBA_NEVA" then
        layer = "CARRIER"
    --place repair ships in the middle, so they can repair more units
    elseif gameObject.Get_Type().Get_Name() == "GALLOFREE_FLEET_TENDER" then
        layer = "REPAIR"
    elseif gameObject.Get_Type().Get_Name() == "EXECUTOR_STAR_DESTROYER" or
        gameObject.Get_Type().Get_Name() == "WARLORD_ZSINJ" or
        gameObject.Get_Type().Get_Name() == "CAPTAIN_PIETT_EXECUTOR" or
        gameObject.Get_Type().Get_Name() == "MANDATOR" then
        layer = "EXECUTOR"
    elseif gameObject.Is_Category("Frigate") then
        layer = "FRIGATE"
    elseif gameObject.Is_Category("Capital") then
        layer = "CAPITAL"
    elseif gameObject.Is_Category("Super") then
        layer = "SUPER"
    end
    local layerMarkerTable = {
        ["TRANSPORT"] = {
            "HEIGHT_850", "HEIGHT_800", "HEIGHT_750", "HEIGHT_700", "HEIGHT_650",
            "HEIGHT_600", "HEIGHT_550", "HEIGHT_500", "HEIGHT_450", "HEIGHT_400",
            "HEIGHT_350", "HEIGHT_300", "HEIGHT_250", "HEIGHT_200", "HEIGHT_150",
            "HEIGHT_100", "HEIGHT_50", "HEIGHT_0"
        },
        ["CORVETTE"] = {
            "HEIGHT_700", "HEIGHT_550", "HEIGHT_400", "HEIGHT_250",
            "HEIGHT_100", "DEPTH_50"
        },
        ["FRIGATE"] = {
            "HEIGHT_650", "HEIGHT_500", "HEIGHT_350", "HEIGHT_200",
            "HEIGHT_50", "DEPTH_100", "DEPTH_250"
        },
        ["CAPITAL"] = {
            "HEIGHT_600", "HEIGHT_450", "HEIGHT_300", "HEIGHT_150",
            "HEIGHT_0", "DEPTH_150", "DEPTH_300"
        },
        ["SUPER"] = {
            "HEIGHT_250", "HEIGHT_100",  "DEPTH_50", "DEPTH_200",
            "DEPTH_350", "DEPTH_500"
        },
        ["EXECUTOR"] = {
            "DEPTH_500", "DEPTH_550", "DEPTH_600"
        },
        ["REPAIR"] = {
            "HEIGHT_300", "HEIGHT_250", "HEIGHT_200", "HEIGHT_150", "HEIGHT_100"
        },
        ["CARRIER"] = {
            "HEIGHT_500", "HEIGHT_450", "HEIGHT_400", "HEIGHT_350", "HEIGHT_300",
            "HEIGHT_250", "HEIGHT_200"
        },
    }
    local finalBoneTab = layerMarkerTable[layer]
    if finalBoneTab then
        local bone = finalBoneTab[GameRandom(1,table.getn(finalBoneTab))]
        gameObject.Teleport(layerZObj.Get_Bone_Position(bone))
    else
        gameObject.Teleport(layerZObj.Get_Position())
    end
    layerZObj.Despawn()
end

--- Only function that needs to be called from the gameobject script.
-- @tparam GameObject gameObject
function libLayerZ.enterBattlefield(gameObject)
    libLayerZ.disableObject(gameObject)
    gameObject.Cancel_Hyperspace()
    libLayerZ.hideObject(gameObject)
    libLayerZ.setLayerZ(gameObject)
    gameObject.Cinematic_Hyperspace_In(1)
    libLayerZ.enableObject(gameObject)
end

return libLayerZ
