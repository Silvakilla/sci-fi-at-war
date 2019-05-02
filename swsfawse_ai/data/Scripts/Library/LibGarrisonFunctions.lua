--Author Anakin_Sklavenwalker--
--Modified for AotR use by MaxiM--
require("PGStateMachine")
require("PGSpawnUnits")

--- Function that chooses a random unit from a list of unit using their weights
--
-- @param faction_name name of the faction getting a unit for
-- @param unit_list list of possible units
-- @param csum weighting for chance of unit
-- @param totalweight highest weight
-- @param size size of unit_list
--
function GetUnitFrom(faction_name, unit_list, csum, totalweight, size)
    randomweight = GameRandom(0, totalweight)

    iteration = 1
    while iteration <= size do
        if csum[iteration] >= randomweight then
            if faction_name == "Rebel" or faction_name == "Empire" then
                if CheckSpaceTech(faction_name, unit_list[iteration]) then
                    return Find_Object_Type(unit_list[iteration])
                else
                    return nil
                end
            else
                return Find_Object_Type(unit_list[iteration])
            end
        end
        iteration = iteration + 1
    end
end

--- Function that is called by the corresponding LUAs to run the Upgrade Functionality
--
-- @param faction_name name of the faction running the Upgrade
-- @param unit_count how many units should be reinforced
-- @param list_name of what list should the units be choosen from
--
function UpgradeRoutine(faction_name, unit_count, list_name)
    _Ggarrison_table = require("libGarrisonTable")
    garrison_list = {}

    for _,garrison in pairs(_Ggarrison_table) do
        if garrison.ListName == list_name then
            unit_list = garrison.UnitList
            weights = garrison.Weights
        end
    end
    size = table.getn(unit_list)
    csum = CalculateCsum(weights)
    totalweight = csum[size]

    counter = 1
    while counter <= unit_count do
        unit = GetUnitFrom(faction_name, unit_list, csum, totalweight, size)
        if unit ~= nil then
            table.insert(garrison_list, unit)
            counter = counter + 1
        end
    end

    if Object.Get_Owner().Is_Human() then
        Object.Play_SFX_Event("UHD_Reinforcements_Available")
    end

    SpawnReinforcements(garrison_list, faction_name)
end

--- Function that spawns all garrison units at the Defending Forces Position marker.
--
-- @param garrison_list list of units to be spawned onto the battlefield
-- @param faction_name name of the faction, that gets units spawned in
--
function SpawnReinforcements(garrison_list, faction_name)
    marker = Find_First_Object("Defending Forces Position")

    if not Object.Get_Owner().Is_Human() then
        sleep_time = GameRandom(20, 50)
        Sleep(sleep_time)
    end

    for _,garrison in pairs(garrison_list) do
        spawn = Spawn_Unit(garrison, marker, Find_Player(faction_name))
        spawn[1].Teleport_And_Face(marker)
        spawn[1].Cinematic_Hyperspace_In(90)
        sleep_time = GameRandom(1,5)
        Sleep(sleep_time)
    end
end

--- Function, that checks if the player has the required Space Tech for the given unit. Returns true if yes, false if no.
--
-- @param faction_name name of the faction, needed for the unit table and the Space Tech GlobalValue
-- @param unit_name name of the unit to check
--
function CheckSpaceTech(faction_name, unit_name)
    if faction_name == "Rebel" then
        _Gunit_table = require("libUnitTableRebel")
        if Object.Get_Owner().Is_Human() then
            techlevel  = "Space_Tech_Level_Rebel"
        else
            techlevel  = "Space_Tech_Level_Rebel_AI"
        end
    elseif faction_name == "Empire" then
        _Gunit_table = require("libUnitTableEmpire")
        if Object.Get_Owner().Is_Human() then
            techlevel  = "Space_Tech_Level_Empire"
        else
            techlevel  = "Space_Tech_Level_Empire_AI"
        end
    end

    for _,unit in pairs(_Gunit_table) do
        if unit.UnitName == unit_name then
            if unit.SpaceTech > GlobalValue.Get(techlevel) then
                return false
            else
                return true
            end
        end
    end
end

--- Function that calculates the Csumlist out of a given weightlist.
-- Example = {50, 40, 30} => {50, 90, 120}
--
-- @param weight_list the weight_list to calculate the Csum for
--
function CalculateCsum(weight_list)
    size = table.getn(weight_list)
    csum_list = {}
    counter = 1

    while size >= counter do
        if counter == 1 then
            table.insert(csum_list, weight_list[counter])
        else
             csum = csum_list[counter-1] + weight_list[counter]
            table.insert(csum_list, csum)
        end
        counter = counter + 1
    end

    return csum_list
end

--- Function used by the AI to simulate the upgrade
-- DOESNT SEEM TO WORK, AI DOESNT PORT IN REINFORCEMENTS
-- @param credits cost of upgrade to imitate
-- @param time buildtime of the upgrade to imitate
--
function AIGarrisonRoutine(faction_name, unit_count, list_name, credits, time)
    if Find_Player(faction_name).Get_Credits() > credits then
        sleep_time = GameRandom(time, time+50)
        Sleep(sleep_time)
        UpgradeRoutine(faction_name, unit_count, list_name)
    end
end