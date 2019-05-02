--Author MaxiM--
--Thanks to Kad_Venku--

require("PGStoryMode")

--- Function that unlocks all units inside the given unit_table by calling the Unlock_Unit_Event inside the given XML-File.
--
-- @param unit_table units to be unlocked
-- @param xml_file_name name of the XML-File
--
function Unlock_List(unit_table, xml_file_name)
    plot = Get_Story_Plot(xml_file_name)
    event = plot.Get_Event("Unlock_Unit_Event")

    for _,unit in pairs(unit_table) do
        event.Set_Reward_Parameter(0, unit)
        Story_Event("UNLOCK_UNIT_NOTIFICATION")
    end
end

--- Function that locks all units inside the given unit_table by calling the Lock_Unit_Event inside the given XML-File.
--
-- @param unit_table units to be locked
-- @param xml_file_name name of the XML-File
--
function Lock_List(unit_table, xml_file_name)
    plot = Get_Story_Plot(xml_file_name)
    event = plot.Get_Event("Lock_Unit_Event")

    for _,unit in pairs(unit_table) do
        event.Set_Reward_Parameter(0, unit)
        Story_Event("LOCK_UNIT_NOTIFICATION")
    end
end

--- Function that sets the isBuildable attribute of the given unit to the given state.
--
-- @param unit_table table containing the unit
-- @param unit_to_be_buildable unit to change the isBuildable attribute
-- @param state state to change isBuildable to
--
function SetBuildable(unit_table, unit_to_be_buildable, state)
    for _,unit in pairs(unit_table) do
        if unit.UnitName == unit_to_be_buildable then
            unit.IsBuildable = state
        end
    end

    return unit_table
end

--- Function that returns all units, that have isBuildable as true and have the given category.
--
-- @param unit_table table to get all buildable units from
-- @param category category of the buildable units
--
function GetBuildableWithCategory(unit_table, category)
    buildable_units = {}

    for _,unit in pairs(unit_table) do
        if unit.IsBuildable and unit.Category == category then
            table.insert(buildable_units, unit.UnitName)
        end
    end

    return buildable_units
end

--- Function that returns all units, that have isBuildable as true and don't have the given category.
--
-- @param unit_table table to get all buildable units from
-- @param category category that the buildable units arent from
--
function GetBuildableWithoutCategory(unit_table, category)
    buildable_units = {}

    for _,unit in pairs(unit_table) do
        if unit.IsBuildable and unit.Category ~= category then
            table.insert(buildable_units, unit.UnitName)
        end
    end

    return buildable_units
end

--- Function that returns a table with all units. If the action is "Unlock" only buildable units are returned, if the
-- action is "Lock" all units are returned.
--
-- @param unit_table table to get all units from
-- @param action action that will be done after getting the table. Either "Unlock" or "Lock"
--
function GetAllUnits(unit_table, action)
    all_units = {}

    for _,unit in pairs(unit_table) do
        if action == "Unlock" and unit.IsBuildable then
            table.insert(all_units, unit.UnitName)
        elseif action == "Lock" then
            table.insert(all_units, unit.UnitName)
        end
    end

    return all_units
end

--- Function that fills a table with either all space units or only the names of all space units.
-- @param unit_table table to get all space units from
-- @param name true if only names are wanted
--
function GetAllUnitsSpace(unit_table, name)
    all_units = {}

    for _,unit in pairs(unit_table) do
        if unit.IsBuildable and (unit.Category == "SpaceBuildings"
                            or unit.Category == "SpaceCapitals"
                            or unit.Category == "SpaceFrigates"
                            or unit.Category == "SpaceCorvettesFighters") then
            if name then
                table.insert(all_units, unit.UnitName)
            else
                table.insert(all_units, unit)
            end
        end
    end

    return all_units
end

--- Function that fills a table with either all ground units or only the names of all ground units.
-- @param unit_table table to get all ground units from
-- @param name true if only names are wanted
--
function GetAllUnitsGround(unit_table, name)
    all_units = {}

    for _,unit in pairs(unit_table) do
        if unit.IsBuildable and (unit.Category == "GroundBuildings"
                            or unit.Category == "GroundVehicles"
                            or unit.Category == "GroundInfantry"
                            or unit.Category == "GroundUpgrades") then
            if name then
                table.insert(all_units, unit.UnitName)
            else
                table.insert(all_units, unit)
            end
        end
    end

    return all_units
end