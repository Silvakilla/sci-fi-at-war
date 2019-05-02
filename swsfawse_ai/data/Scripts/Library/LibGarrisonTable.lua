--Author MaxiM--
--Thanks to Anakin_Sklavenwalker--
GarrisonTable = {
    --***** PLANETARY DEFENSE GARRISONS *****--
    {
        ListName = "CorSec_Planetary_Defense",
        UnitList = {"Corellian_Battlecruiser", "CorSec_Frigate", "Corellian_Destroyer", "CorSec_Light_Frigate"},
        Weights = {25, 40, 50, 30},
    },
    {
        ListName = "Bakura_Planetary_Defense",
        UnitList = {"Bakura_Destroyer"},
        Weights = {100},
    },
    --TODO add in new Hapan units
    {
        ListName = "Hapes_Planetary_Defense",
        UnitList = {"Battledragon"},
        Weights = {100},
    },
    {
        ListName = "Bothawui_Planetary_Defense",
        UnitList = {"BothanAssaultCruiser_R"},
        Weights = {100},
    },
    --***** REBEL GARRISONS *****--
    {
        ListName = "Rebel_Fighter_Shipyard",
        UnitList = {"Rebel_X_Wing_Squadron", "Y_Wing_Squadron", "A_Wing_Squadron", "B_Wing_Squadron", "Corellian_Corvette", "Marauder_Missile_Cruiser", "Dornean_Gunship_Squadron", "Corellian_Gunboat"},
        Weights = {60, 60, 50, 40, 25, 20, 30, 15},
    },
    {
        ListName = "Rebel_Frigate_Shipyard",
        UnitList = {"Alliance_Bulk_Cruiser", "Alliance_Dreadnaught", "Nebulon_B_Frigate", "MC40", "Alliance_Light_Frigate", "Alliance_Assault_Frigate", "MC60"},
        Weights = {50, 50, 50, 40, 40, 35, 30, 20},
    },
    {
        ListName = "Rebel_Capital_Shipyard",
        UnitList = {"Rebel_Liberator_Cruiser", "MC80_Freedom", "MC80_Justice", "MC80_Liberty", "MC80a_Alliance", "Dauntless_Class_R"},
        Weights = {50, 45, 50, 30, 35, 20},
    },
    --***** EMPIRE GARRISONS *****--
    {
        ListName = "Empire_Frigate_Shipyard",
        UnitList = {"IPV1_System_Patrol_Craft_Squadron", "Arquitens_Light_Cruiser", "Carrack_Cruiser", "Lancer_Frigate", "Imperial_Dreadnaught", "Nebulon_B2_Frigate"},
        Weights = {50, 50, 40, 30, 60, 50},
    },
    {
        ListName = "Empire_Frigate_Shipyard_FighterModule",
        UnitList = {"Carrack_Cruiser", "Lancer_Frigate", "Imperial_Dreadnaught", "Nebulon_B2_Frigate", "Vindicator_Cruiser", "Imperial_Gladiator_Star_Destroyer", "Imperial_Gladiator_Star_Destroyer_Fighters",
            "Imperial_Escort_Carrier", "Imperial_Escort_Carrier_Advanced_Loadout", "Imperial_Escort_Carrier_Bomber_Loadout", "Imperial_Escort_Carrier_Fighter_Loadout", "Imperial_Escort_Frigate"},
        Weights = {20, 15, 30, 25, 20, 15, 10,
            60, 40, 40, 30, 40},
    },
    {
        ListName = "Empire_Frigate_Shipyard_CruiserModule",
        UnitList = {"Carrack_Cruiser", "Lancer_Frigate", "Imperial_Dreadnaught", "Nebulon_B2_Frigate", "Vindicator_Cruiser", "Imperial_Gladiator_Star_Destroyer",
            "Imperial_StrikeCruiser", "Broadside_Class_Cruiser", "Interdictor_Cruiser"},
        Weights = {20, 15, 30, 25, 20, 15,
            50, 40, 30},
    },
    {
        ListName = "Empire_Capital_Shipyard",
        UnitList = {"Imperial_VictoryI_Destroyer", "Imperial_VictoryII_Destroyer", "Imperial_Star_Destroyer", "Tector_Star_Destroyer"},
        Weights = {60, 50, 40, 30},
    },
    {
        ListName = "Empire_Capital_Shipyard_FighterModule",
        UnitList = {"Imperial_VictoryI_Destroyer", "Imperial_VictoryII_Destroyer", "Imperial_Star_Destroyer", "Tector_Star_Destroyer",
            "Imperial_VictoryI_Destroyer_Fighters", "Imperial_VictoryII_Destroyer_Fighters", "Imperial_Star_Destroyer_Fighters"},
        Weights = {30, 25, 20, 15,
            60, 50, 40},
    },
    {
        ListName = "Empire_Capital_Shipyard_SuperModule",
        UnitList = {"Imperial_VictoryI_Destroyer", "Imperial_VictoryII_Destroyer", "Imperial_Star_Destroyer", "Tector_Star_Destroyer",
            "Imperial_Star_Destroyer2", "Battlecruiser_Praetor_Empire"},
        Weights = {30, 25, 20, 15,
            50, 5},
    },
}
return GarrisonTable


