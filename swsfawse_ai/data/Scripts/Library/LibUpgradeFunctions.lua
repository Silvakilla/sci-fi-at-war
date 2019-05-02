-- Author MaxiM --

require("PGStateMachine")
require("PGSpawnUnits")


--- Function that checks if there already is a higher level structure on a planet. If thats the case, it returns
--  money and throws an error message.
--
-- @param planet planet, where the building that needs checking is
-- @param player playerobject
-- @param higher_level_structure name of the higher level structure
-- @param money money that will be returned if the player has higher level building
-- @param error_message error message that will be thrown if the player has a higher level building
-- @return true if a higher level structure exists, false if not
--
function Check_For_Higher_Level(planet, player, higher_level_structure, money, error_message)
    higher_level_structure = Find_Object_Type(higher_level_structure)
    higher_level_structure_list = Find_All_Objects_Of_Type(higher_level_structure)
    has_higher_level = false

    for _,unit in pairs(higher_level_structure_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet then
            has_higher_level = true
            Game_Message(error_message)
            if player.Is_Human() then
                player.Give_Money(money)
            end
        end
    end

    return has_higher_level
end

--- Function that sets a structure on a given planet. Is used for all level 1 structures and replaceable structures, like
-- rebel warehouses.
--
-- @param planet planet, where the building should be set
-- @param player playerobject
-- @param structure_name name of the structure to set
-- @param money money that the player gets, if the structure is already set
-- @param error_message error message if the structure on that planet already exists
--
function Set_Structure(planet, player, structure_name, money, error_message)
    structure = Find_Object_Type(structure_name)
    structure_list = Find_All_Objects_Of_Type(structure)
    already_set = false

    for _, unit in pairs(structure_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet then
            already_set = true
            Game_Message(error_message)
            if player.Is_Human() then
                player.Give_Money(money)
            end
        end
    end

    if already_set == false then
        SpawnList({structure_name}, planet, player, false, false)
    end
end

--- Function that upgrades a building to a higher level. If the building was already upgraded, the player gets money
--  back.
--
-- @param planet planet, where the building to upgrade is
-- @param player playerobject
-- @param previous_structure name of the structure to upgrade
-- @param upgraded_structure name of the upgraded structure
-- @param money amount of money, that will be returned if the player already did the upgrade
--
function Upgrade_Structure(planet, player, previous_structure, upgraded_structure, money)
    previous_structure = Find_Object_Type(previous_structure)
    previous_structure_list = Find_All_Objects_Of_Type(previous_structure)
    already_upgraded = false

    for _, unit in pairs(previous_structure_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet then
            unit.Despawn()
            already_upgraded = true
            SpawnList({upgraded_structure}, planet, player, false, false)
        end
    end

    if already_upgraded == false then
        if player.Is_Human() then
            player.Give_Money(money)
        end
    end
end

--- Function that downgrades a structure and returns the player money.
--
-- @param planet planet, where the structure to downgrade is
-- @param player playerobject
-- @param previous_structure name of the structure to downgrade
-- @param downgraded_structure name of the downgraded structure
-- @param money amount of money, that the player gets for a succesfull downgrade
--
function Downgrade_Structure(planet, player, previous_structure, downgraded_structure, money)
    previous_structure = Find_Object_Type(previous_structure)
    previous_structure_list = Find_All_Objects_Of_Type(previous_structure)

    for _,unit in pairs(previous_structure_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet then
            unit.Despawn()
            SpawnList({downgraded_structure}, planet, player, false, false)
            if player.Is_Human() then
                player.Give_Money(money)
            end
        end
    end
end

--- Function that replaces a building for the Object that was build instead. Returns money to make up for the replaced
--  building.
--
-- @param planet planet, where the structure to be replaced is
-- @param player playerobject
-- @param replaced_structure name of the structure to be replaced
-- @param money amount of money the player gets, to make up for the replaced structure
-- @return true if a structure was replaced, false if not
--
function Replace_Structure(planet, player, replaced_structure, placed_structure, money)
    replaced_structure = Find_Object_Type(replaced_structure)
    replaced_structure_list = Find_All_Objects_Of_Type(replaced_structure)
    has_replaced = false

    for _,unit in pairs(replaced_structure_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet then
            has_replaced = true
            unit.Despawn()
            SpawnList({placed_structure}, planet, player, false, false)
            if player.Is_Human() then
                player.Give_Money(money)
            end
        end
    end

    return has_replaced
end

--- Function used for a simple deletion of a building.
--
-- @param planet planet where the building to be removed is
-- @param player playerobject
-- @param building name of the building to be removed
-- @param money amount of money the player gets for removing the building
--
function Delete_Building(planet, player, building, money)
    building = Find_Object_Type(building)
    building_list = Find_All_Objects_Of_Type(building)
    structures_removed = 0

    for _,unit in pairs(building_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet  and structures_removed == 0 then
            unit.Despawn()
            structures_removed = structures_removed + 1
            if player.Is_Human() then
                player.Give_Money(money)
            end
        end
    end
end

--- Function used to upgrade a unit.
--
-- @param planet planet where the unit to be upgraded is
-- @param player playerobject
-- @param unit_to_upgrade name of the unit, that should be upgraded
-- @param upgraded_unit name of the upgraded unit
--
function Upgrade_Unit(planet, player, unit_to_upgrade, upgraded_unit)
    unit_to_upgrade = Find_Object_Type(unit_to_upgrade)
    unit_to_upgrade_list = Find_All_Objects_Of_Type(unit_to_upgrade)
    units_removed = false

    for _,unit in pairs(unit_to_upgrade_list) do
        if TestValid(unit) and unit.Get_Planet_Location() == planet and units_removed == false then
            units_removed = true
            unit.Despawn()
            SpawnList({upgraded_unit}, planet, player, false, false)
        end
    end
end