
--- Function used to find target planets for Interventions.
--
-- @param playerFaction faction of the player
-- @param targetIsEnemyControlled is the target supposed to be enemy (true) or friendly (false) controlled
-- @param groundAccessibleOnly is the target supposed to be only accesable on ground (true) or also space only (false)
--
function FindTargetPlanet(playerFaction, targetIsEnemyControlled, groundAccessibleOnly)
    --Regular planets
    aargau = Find_First_Object("Aargau")
    abregado_rae = Find_First_Object("Abregado_Rae")
    aetenII = Find_First_Object("AetenII")
    allyen = Find_First_Object("Allyen")
    anaxes = Find_First_Object("Anaxes")
    anoat = Find_First_Object("Anoat")
    atzerri = Find_First_Object("Atzerri")
    bakura = Find_First_Object("Bakura")
    bastion = Find_First_Object("Bastion")
    bespin = Find_First_Object("Bespin")
    bilbringi = Find_First_Object("Bilbringi")
    bonadan = Find_First_Object("Bonadan")
    borleias = Find_First_Object("Borleias")
    bothawui = Find_First_Object("Bothawui")
    byss = Find_First_Object("Byss")
    carida = Find_First_Object("Carida")
    corulag = Find_First_Object("Corulag")
    dantooine = Find_First_Object("Dantooine")
    dathomir = Find_First_Object("Dathomir")
    deltooine = Find_First_Object("Deltooine")
    endor = Find_First_Object("Endor")
    eriadu = Find_First_Object("Eriadu")
    ession = Find_First_Object("Ession")
    ettiiv = Find_First_Object("EttiIV")
    felucia = Find_First_Object("Felucia")
    fondor = Find_First_Object("Fondor")
    fresia = Find_First_Object("Fresia")
    gamorr = Find_First_Object("Gamorr")
    geonosis = Find_First_Object("Geonosis")
    ghorman = Find_First_Object("Ghorman")
    hapes = Find_First_Object("Hapes")
    honoghr = Find_First_Object("Honoghr")
    hypori = Find_First_Object("Hypori")
    ilum = Find_First_Object("Ilum")
    ithor = Find_First_Object("Ithor")
    jabiim = Find_First_Object("Jabiim")
    kalee = Find_First_Object("Kalee")
    kamino = Find_First_Object("Kamino")
    kashyyyk = Find_First_Object("Kashyyyk")
    kessel = Find_First_Object("Kessel")
    korriban = Find_First_Object("Korriban")
    lok = Find_First_Object("Lok")
    manaan = Find_First_Object("Manaan")
    mustafar = Find_First_Object("Mustafar")
    muunilinst = Find_First_Object("Muunilinst")
    mygeeto = Find_First_Object("Mygeeto")
    myrkr = Find_First_Object("Myrkr")
    naboo = Find_First_Object("Naboo")
    nalhutta = Find_First_Object("NalHutta")
    onderon = Find_First_Object("Onderon")
    polus = Find_First_Object("Polus")
    ryloth = Find_First_Object("Ryloth")
    saleucami = Find_First_Object("Saleucami")
    shola = Find_First_Object("Shola")
    sullust = Find_First_Object("Sullust")
    taris = Find_First_Object("Taris")
    telos = Find_First_Object("Telos")
    thyferra = Find_First_Object("Thyferra")
    trandosha = Find_First_Object("Trandosha")
    umbara = Find_First_Object("Umbara")
    utapau = Find_First_Object("Utapau")
    yaga_minor = Find_First_Object("Yaga_Minor")
    ylesia = Find_First_Object("Ylesia")
    zhar = Find_First_Object("Zhar")
    adumar = Find_First_Object("Adumar")
    cato_neimodia = Find_First_Object("Cato_Neimodia")
    chandrila = Find_First_Object("Chandrila")
    concord_dawn = Find_First_Object("Concord_Dawn")
    devaron = Find_First_Object("Devaron")
    malastare = Find_First_Object("Malastare")
    orto_plutonia = Find_First_Object("Orto_Plutonia")
    rattatak = Find_First_Object("Rattatak")
    raxus_prime = Find_First_Object("Raxus_Prime")
    rendili = Find_First_Object("Rendili")
    rhen_var = Find_First_Object("Rhen_Var")
    rodia = Find_First_Object("Rodia")
    rothana = Find_First_Object("Rothana")
    scipio = Find_First_Object("Scipio")
    sluis_van = Find_First_Object("Sluis_Van")
    terephon = Find_First_Object("Terephon")
    thrakia = Find_First_Object("Thrakia")
    aridus = Find_First_Object("Aridus")
    nimban = Find_First_Object("Nimban")

    --Space only planets
    alderaan = Find_First_Object("Alderaan")
    deepspace1 = Find_First_Object("DeepSpace1")
    deepspace2 = Find_First_Object("DeepSpace2")
    deepspace3 = Find_First_Object("DeepSpace3")
    deepspace4 = Find_First_Object("DeepSpace4")
    deepspace5 = Find_First_Object("DeepSpace5")
    deepspace6 = Find_First_Object("DeepSpace6")
    falleen = Find_First_Object("Falleen")
    ordibanna = Find_First_Object("OrdIbanna")
    rocheasteroids = Find_First_Object("RocheAsteroids")
    the_maw = Find_First_Object("The_Maw")
    thewheel = Find_First_Object("TheWheel")
    toydaria = Find_First_Object("Toydaria")

    --Main planets
    corellia = Find_First_Object("Corellia")
    coruscant = Find_First_Object("Coruscant")
    kuat = Find_First_Object("Kuat")
    hoth = Find_First_Object("Hoth")
    moncalimari = Find_First_Object("MonCalimari")
    yavin = Find_First_Object("Yavin")
    mandalore = Find_First_Object("Mandalore")
    ordmantell = Find_First_Object("OrdMantell")
    tatooine = Find_First_Object("Tatooine")

    planet_list = {aargau, abregado_rae, aetenII, allyen, anaxes,
        anoat, atzerri, bakura, bastion, bespin,
        bilbringi, bonadan, borleias, bothawui, byss,
        carida, corulag, dantooine, dathomir, deltooine,
        endor, eriadu, ession, ettiiv, felucia,
        fondor, fresia, gamorr, geonosis, ghorman,
        hapes, honoghr, hypori, ilum, ithor,
        jabiim, kalee, kamino, kashyyyk, kessel,
        korriban, lok, manaan, mustafar, muunilinst,
        mygeeto, myrkr, naboo, nalhutta, onderon,
        polus, ryloth, saleucami, shola, sullust,
        taris, telos, thyferra, trandosha, umbara,
        utapau, yaga_minor, ylesia, zhar, adumar,
        cato_neimodia, chandrila, concord_dawn, devaron, malastare,
        orto_plutonia, rattatak, raxus_prime, rendili, rhen_var,
        rodia, rothana, scipio, sluis_van, terephon,
        thrakia, aridus, nimban}

    space_only_list = {alderaan, deepspace1, deepspace2, deepspace3, deepspace4,
        deepspace5, deepspace6, ordibanna, the_maw, thewheel,
        falleen, rocheasteroids, toydaria}

    main_planet_list = {corellia, coruscant, kuat, hoth, moncalimari,
        yavin, mandalore, ordmantell, tatooine}

    target_planet_list = {}
    
    --if we want space
    if not groundAccessibleOnly then
        for _,planet in pairs(space_only_list) do
            if TestValid(planet) then
                table.insert(planet_list, planet)
            end
        end
    end

    --fill the target list depending on playerFaction and if the target should be enemy controlled or friendly
    if targetIsEnemyControlled then
        if playerFaction == "REBEL" then
            AIFaction1 = "EMPIRE"
            AIFaction2 = "UNDERWORLD"
        elseif playerFaction == "EMPIRE" then
            AIFaction1 = "REBEL"
            AIFaction2 = "UNDERWORLD"
        elseif playerFaction == "UNDERWORLD" then
            AIFaction1 = "REBEL"
            AIFaction2 = "EMPIRE"
        end

        for _,planet in pairs(planet_list) do
            if TestValid(planet) then
                owner = planet.Get_Owner().Get_Faction_Name()
                if (owner == AIFaction1 or owner == AIFaction2) and EvaluatePerception("Is_Connected_To_Me", Find_Player(playerFaction), planet) == 1 then
                    table.insert(target_planet_list, planet)
                end
            end
        end

        --only if the enemy only has its main planets left, use them for interventions
        if table.getn(target_planet_list) == 0 then
            for _,planet in pairs(main_planet_list) do
                if TestValid(planet) then
                    owner = planet.Get_Owner().Get_Faction_Name()
                    if (owner == AIFaction1 or owner == AIFaction2) and EvaluatePerception("Is_Connected_To_Me", Find_Player(playerFaction), planet) == 1 then
                        table.insert(target_planet_list, planet)
                    end
                end
            end
        end
    else
        for _,planet in pairs(planet_list) do
            if TestValid(planet) then
                owner = planet.Get_Owner().Get_Faction_Name()
                if owner == playerFaction then
                    table.insert(target_planet_list, planet)
                end
            end
        end

        --only if the enemy only has its main planets left, use them for interventions
        if table.getn(target_planet_list) == 0 then
            for _,planet in pairs(main_planet_list) do
                if TestValid(planet) then
                    owner = planet.Get_Owner().Get_Faction_Name()
                    if owner == playerFaction then
                        table.insert(target_planet_list, planet)
                    end
                end
            end
        end
    end


    planetcount = table.getn(target_planet_list)
    random = GameRandom.Free_Random(1, planetcount)
    target = target_planet_list[random]

    return target
end

--- Function, that counts how many planets a faction still controls. Used for AI_Hero_Reapawner.
--
-- @param faction name of the faction
--
function Get_Planet_Count(faction)
    planet_list = FindPlanet.Get_All_Planets()

    planetcount = 0

    for _,planet in pairs(planet_list) do
        if TestValid(planet) then
            owner = planet.Get_Owner().Get_Faction_Name()
            if owner == faction then
                planetcount = planetcount + 1
            end
        end
    end

    return planetcount
end

--- Function that is used to find a planet for imprisoned heroes. Is used in Hero_Prisoners.
--
-- @param faction faction of the imprisoned hero
--
function Get_Prison_Planet(faction)
    --Regular planets
    aargau = Find_First_Object("Aargau")
    abregado_rae = Find_First_Object("Abregado_Rae")
    aetenII = Find_First_Object("AetenII")
    allyen = Find_First_Object("Allyen")
    anaxes = Find_First_Object("Anaxes")
    anoat = Find_First_Object("Anoat")
    atzerri = Find_First_Object("Atzerri")
    bakura = Find_First_Object("Bakura")
    bastion = Find_First_Object("Bastion")
    bespin = Find_First_Object("Bespin")
    bilbringi = Find_First_Object("Bilbringi")
    bonadan = Find_First_Object("Bonadan")
    borleias = Find_First_Object("Borleias")
    bothawui = Find_First_Object("Bothawui")
    byss = Find_First_Object("Byss")
    carida = Find_First_Object("Carida")
    corulag = Find_First_Object("Corulag")
    dantooine = Find_First_Object("Dantooine")
    dathomir = Find_First_Object("Dathomir")
    deltooine = Find_First_Object("Deltooine")
    endor = Find_First_Object("Endor")
    eriadu = Find_First_Object("Eriadu")
    ession = Find_First_Object("Ession")
    ettiiv = Find_First_Object("EttiIV")
    felucia = Find_First_Object("Felucia")
    fondor = Find_First_Object("Fondor")
    fresia = Find_First_Object("Fresia")
    gamorr = Find_First_Object("Gamorr")
    geonosis = Find_First_Object("Geonosis")
    ghorman = Find_First_Object("Ghorman")
    hapes = Find_First_Object("Hapes")
    honoghr = Find_First_Object("Honoghr")
    hypori = Find_First_Object("Hypori")
    ilum = Find_First_Object("Ilum")
    ithor = Find_First_Object("Ithor")
    jabiim = Find_First_Object("Jabiim")
    kalee = Find_First_Object("Kalee")
    kamino = Find_First_Object("Kamino")
    kashyyyk = Find_First_Object("Kashyyyk")
    kessel = Find_First_Object("Kessel")
    korriban = Find_First_Object("Korriban")
    lok = Find_First_Object("Lok")
    manaan = Find_First_Object("Manaan")
    mustafar = Find_First_Object("Mustafar")
    muunilinst = Find_First_Object("Muunilinst")
    mygeeto = Find_First_Object("Mygeeto")
    myrkr = Find_First_Object("Myrkr")
    naboo = Find_First_Object("Naboo")
    nalhutta = Find_First_Object("NalHutta")
    onderon = Find_First_Object("Onderon")
    polus = Find_First_Object("Polus")
    ryloth = Find_First_Object("Ryloth")
    saleucami = Find_First_Object("Saleucami")
    shola = Find_First_Object("Shola")
    sullust = Find_First_Object("Sullust")
    taris = Find_First_Object("Taris")
    telos = Find_First_Object("Telos")
    thyferra = Find_First_Object("Thyferra")
    trandosha = Find_First_Object("Trandosha")
    umbara = Find_First_Object("Umbara")
    utapau = Find_First_Object("Utapau")
    yaga_minor = Find_First_Object("Yaga_Minor")
    ylesia = Find_First_Object("Ylesia")
    zhar = Find_First_Object("Zhar")
    adumar = Find_First_Object("Adumar")
    cato_neimodia = Find_First_Object("Cato_Neimodia")
    chandrila = Find_First_Object("Chandrila")
    concord_dawn = Find_First_Object("Concord_Dawn")
    devaron = Find_First_Object("Devaron")
    malastare = Find_First_Object("Malastare")
    orto_plutonia = Find_First_Object("Orto_Plutonia")
    rattatak = Find_First_Object("Rattatak")
    raxus_prime = Find_First_Object("Raxus_Prime")
    rendili = Find_First_Object("Rendili")
    rhen_var = Find_First_Object("Rhen_Var")
    rodia = Find_First_Object("Rodia")
    rothana = Find_First_Object("Rothana")
    scipio = Find_First_Object("Scipio")
    sluis_van = Find_First_Object("Sluis_Van")
    terephon = Find_First_Object("Terephon")
    thrakia = Find_First_Object("Thrakia")
    aridus = Find_First_Object("Aridus")
    nimban = Find_First_Object("Nimban")

    --Space only planets
    alderaan = Find_First_Object("Alderaan")
    deepspace1 = Find_First_Object("DeepSpace1")
    deepspace2 = Find_First_Object("DeepSpace2")
    deepspace3 = Find_First_Object("DeepSpace3")
    deepspace4 = Find_First_Object("DeepSpace4")
    deepspace5 = Find_First_Object("DeepSpace5")
    deepspace6 = Find_First_Object("DeepSpace6")
    falleen = Find_First_Object("Falleen")
    ordibanna = Find_First_Object("OrdIbanna")
    rocheasteroids = Find_First_Object("RocheAsteroids")
    the_maw = Find_First_Object("The_Maw")
    thewheel = Find_First_Object("TheWheel")
    toydaria = Find_First_Object("Toydaria")

    --Main planets
    corellia = Find_First_Object("Corellia")
    coruscant = Find_First_Object("Coruscant")
    kuat = Find_First_Object("Kuat")
    hoth = Find_First_Object("Hoth")
    moncalimari = Find_First_Object("MonCalimari")
    yavin = Find_First_Object("Yavin")
    mandalore = Find_First_Object("Mandalore")
    ordmantell = Find_First_Object("OrdMantell")
    tatooine = Find_First_Object("Tatooine")

    planet_list = {aargau, abregado_rae, aetenII, allyen, anaxes,
        anoat, atzerri, bakura, bastion, bespin,
        bilbringi, bonadan, borleias, bothawui, byss,
        carida, corulag, dantooine, dathomir, deltooine,
        endor, eriadu, ession, ettiiv, felucia,
        fondor, fresia, gamorr, geonosis, ghorman,
        hapes, honoghr, hypori, ilum, ithor,
        jabiim, kalee, kamino, kashyyyk, kessel,
        korriban, lok, manaan, mustafar, muunilinst,
        mygeeto, myrkr, naboo, nalhutta, onderon,
        polus, ryloth, saleucami, shola, sullust,
        taris, telos, thyferra, trandosha, umbara,
        utapau, yaga_minor, ylesia, zhar, adumar,
        cato_neimodia, chandrila, concord_dawn, devaron, malastare,
        orto_plutonia, rattatak, raxus_prime, rendili, rhen_var,
        rodia, rothana, scipio, sluis_van, terephon,
        thrakia, ardidus, nimban,
        alderaan, deepspace1, deepspace2, deepspace3, deepspace4,
        deepspace5, deepspace6, ordibanna, the_maw, thewheel,
        falleen, rocheasteroids, toydaria }

    main_planet_list = {corellia, coruscant, kuat, hoth, moncalimari,
        yavin, mandalore, ordmantell, tatooine}

    prison_planet_list = {}

    
    for _,obj in pairs(planet_list) do
        if TestValid(obj) then
             owner = obj.Get_Owner().Get_Faction_Name()
            if owner ~= faction and owner ~= "NEUTRAL" and EvaluatePerception("Is_Connected_To_Me", Find_Player(faction), obj) == 1 then
                table.insert(prison_planet_list, obj)
            end
        end
    end

    -- if there was no still planet found, check the main worlds of the factions
    if table.getn(prison_planet_list) == 0 then
        for _,obj in pairs(main_planet_list) do
            if TestValid(obj) then
                 owner = obj.Get_Owner().Get_Faction_Name()
                if owner ~= faction and owner ~= "NEUTRAL" then
                    table.insert(prison_planet_list, obj)
                end
            end
        end
    end

    planetcount = table.getn(prison_planet_list)
    random = GameRandom.Free_Random(1, planetcount)
    planet = prison_planet_list[random]

    return planet
end

--- Function used to find the location of the hidden treasure mission.
--
function Get_Treasure_Location()
    --Regular planets
    aargau = Find_First_Object("Aargau")
    abregado_rae = Find_First_Object("Abregado_Rae")
    anaxes = Find_First_Object("Anaxes")
    bilbringi = Find_First_Object("Bilbringi")
    borleias = Find_First_Object("Borleias")
    byss = Find_First_Object("Byss")
    carida = Find_First_Object("Carida")
    corulag = Find_First_Object("Corulag")
    fresia = Find_First_Object("Fresia")
    manaan = Find_First_Object("Manaan")
    onderon = Find_First_Object("Onderon")
    cato_neimodia = Find_First_Object("Cato_Neimodia")
    chandrila = Find_First_Object("Chandrila")
    devaron = Find_First_Object("Devaron")
    rendili = Find_First_Object("Rendili")
    --Space only planets
    alderaan = Find_First_Object("Alderaan")
    --Main planets
    corellia = Find_First_Object("Corellia")
    coruscant = Find_First_Object("Coruscant")
    kuat = Find_First_Object("Kuat")

    core_world_list = {abregado_rae, bilbringi, borleias, coruscant, corulag,
        carida, anaxes, aargau, byss, corellia,
        cato_neimodia, manaan, onderon, kuat, rendili,
        alderaan, fresia, devaron, chandrila}

    empire_planet_list = {}

    for _,obj in pairs(core_world_list) do
        if TestValid(obj) then
             owner = obj.Get_Owner().Get_Faction_Name()
            if owner == "EMPIRE" then
                table.insert(empire_planet_list, obj)
            end
        end
    end

    planetcount = table.getn(empire_planet_list)
    random = GameRandom.Free_Random(1, planetcount)
    treasure_location = empire_planet_list[random]

    return treasure_location
end