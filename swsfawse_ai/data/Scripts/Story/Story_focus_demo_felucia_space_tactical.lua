LupQ		Ά	hηυ}A   =(none)                       
      require    PGStoryMode    Definitions /   State_Underworld_FocusDemo_Felucia_Space_Begin    PROX_Star_Base    Story_Mode_Service    Path_Clear 7   State_Underworld_Focus_Demo_Felucia_Bomber_Speech_Done :   State_Underworld_Focus_Demo_Felucia_Asteroid_Remove_Movie    Warp_In_Bombers        /                           DebugMessage    %s -- In Definitions 	   tostring    Script    StoryModeEvents )   Underworld_FocusDemo_Felucia_Space_Begin /   State_Underworld_FocusDemo_Felucia_Space_Begin 4   Underworld_Focus_Demo_Felucia_Asteroid_Remove_Movie :   State_Underworld_Focus_Demo_Felucia_Asteroid_Remove_Movie 1   Underworld_Focus_Demo_Felucia_Bomber_Speech_Done 7   State_Underworld_Focus_Demo_Felucia_Bomber_Speech_Done    underworld    Find_Player    Underworld    rebel    Rebel    bomber_tripped    bombers_spawned    path_clear    base_tripped    locomotor_tripped    stealth_tripped    kedalbe_spawned    mission_started 
   fog_id_00 
   fog_id_01     +      A    Ε   Y       I  I  I     A   Η    Α             G          Η          G          Η          G        L                          OnEnter    mission_started    GlobalValue    Set    Allow_AI_Controlled_Fog_Reveal            vengeance_02    Find_First_Object    Vengeance_Frigate    vengeance_spawn_00 
   Find_Hint    STORY_TRIGGER_ZONE_00    vengeancespawn00    vengeance_spawn_01    vengeancespawn01    vengeance_00    Spawn_From_Reinforcement_Pool    Find_Object_Type    underworld    vengeance_01    space_station    REBEL_STAR_BASE_3 
   TestValid    Register_Prox    PROX_Star_Base      @@    8     U   Τ  G    FΏ  A YΕ     Α  G  Α  G  E   E   Η  E   E   Η Ε A       T Ε   A  Y      g                       
   Get_Owner    Get_Faction_Name    UNDERWORLD    path_clear    kedalbe_spawned    MessageBox    Warping in Kedalbe.    kedalbe_spawn 
   Find_Hint    STORY_TRIGGER_ZONE_00    kedalbespawn    kedalbe    Spawn_From_Reinforcement_Pool    Find_Object_Type    Kedalbe_Battleship    underworld       π?   Teleport_And_Face    Cinematic_Hyperspace_In       4@   Select_Object    Story_Event    BASE     1   Ύ  Ζ> ? T
 Ε   	  X Τ E  Y  A  Η  E   Ε Ε  Η Ε BΖBΕ Y Ε BCΑ Y Ε CΕ ΒY   E  Y       w                     H      mission_started    bomber_tripped    rebel_unit_list    Find_All_Objects_Of_Type    rebel    pairs 
   TestValid    Suspend_Locomotor 
   turret_00    Find_All_Objects_With_Hint    turretunit00 
   turret_01    turretunit01       π?   turret_flag_00 
   Find_Hint    STORY_TRIGGER_ZONE_00 	   turret00 
   Highlight    Remove_Radar_Blip    turret_blip_00 
   fog_id_00    Undo_Reveal    turret_flag_01 	   turret01    turret_blip_01 
   fog_id_01    crusader_spawn_00    crusaderspawn00    crusader_spawn_01    crusaderspawn01    crusader_spawn_02    crusaderspawn02    crusader_00    Spawn_From_Reinforcement_Pool    Find_Object_Type    Crusader_Gunship    underworld    crusader_01    crusader_02    Teleport_And_Face    Cinematic_Hyperspace_In       4@   crusader_list    Select_Object    Story_Event    BOMBERS    bombers_spawned    path_clear 
   bomber_00 
   bomber_01 
   bomber_02 
   bomber_03 
   bomber_04 
   bomber_05 
   bomber_06 
   bomber_07 
   bomber_08 
   bomber_09    Create_Thread    Path_Clear    kedalbe_spawned    tyber_spawned    kedalbe    Is_Ability_Ready    LEECH_SHIELDS    tyber_spawn    tyberspawn    tyber    Spawn_Unit    The_Peacebringer    Make_Invulnerable     (         E   X   T Ε         E    Y ή       Fΐ Y ]   Tύ E       E     Η     ΖΑ   X    Ε   A      C    Y  Ε   Y  E  D  Y    Ε ΖΑ   X    Ε     Η  Ε  C    Y  Ε  A Y    D  Y        Τ E   X       ΖΑ   X      Ε ΖΑ   X      G   Ε     Η  Ε     G  Ε     Η    Ε 	  Ε E	   G    Ε 	  E E	   	    Ε 	  Ε E	   Η	  E  ΖA  H  Ε Y  	  ΖA  H  E Y  Ε	  ΖA  H  Ε Y  E  ΖA  ΖH  
 Y  	  ΖA  ΖH  
 Y  Ε	  ΖA  ΖH  
 Y  Ε   	   Η
  E  Ε
 Y      Τ  E	 I Y ]   ύ E   Y  Ε     T   X      E   X   T      X      Ε   X   Τ	      X      E   X   T      X      Ε   X   Τ      X      E   X   T      X    Ε   Y      E     T   X   
   Ε ΖΑ      	 Ε  ΖA  N  A   X   T Ε   Α    E  Ε    E	       ΖA  FP   Y    ΖA  H   Y    ΖA  ΖH  
 Y            Σ                           Story_Event    PATH_CLEAR    space_station    Find_First_Object    REBEL_STAR_BASE_3 	   FogOfWar    Reveal    underworld      @@   Add_Radar_Blip    station_blip    rebel_unit_list    Find_All_Objects_Of_Type    rebel    pairs 
   TestValid    Suspend_Locomotor     %      A  Y  Ε         E  @  Ε     Y E     Y   E   Η    Ε Y ή Ε      Β  Y ]   Tύ       δ                          OnEnter    Create_Thread    Warp_In_Bombers          U     E    Y       κ                          OnEnter    stealth_tripped    vengeance_list    Find_All_Objects_Of_Type    Vengeance_Frigate    pairs 
   TestValid    underworld    Select_Object    Story_Event    FLASH_CLOAK    turret_flag_00 
   Find_Hint    STORY_TRIGGER_ZONE_00 	   turret00    turret_flag_01 	   turret01 
   Highlight    Add_Radar_Blip    turret_blip_00 
   fog_id_00 	   FogOfWar    Reveal      @o@   turret_blip_01 
   fog_id_01     F     U   T  G  Ε      E   Y    Τ  Ε ΐ  Y ]  ύ E  Y  A  Η  A  Η Ε ΖΒ  Y  Ε Α YE Δ Ε Ε Α Α  Ε ΖΒ  Y  Ε  YE Δ Ε Ε Α Α G         	                  1      bomber_spawn_00 
   Find_Hint    STORY_TRIGGER_ZONE_00    bomberspawn00    bomber_spawn_01    bomberspawn01    bomber_spawn_02    bomberspawn02    bomber_spawn_03    bomberspawn03    bomber_spawn_04    bomberspawn04    bomber_00_list    Spawn_Unit    Find_Object_Type    Y-WING_SQUADRON_NO_ABILITY    rebel    bomber_01_list    bomber_02_list    bomber_03_list    bomber_04_list    bomber_05_list    bomber_06_list    bomber_07_list    bomber_08_list    bomber_09_list 
   bomber_00       π?
   bomber_01 
   bomber_02 
   bomber_03 
   bomber_04 
   bomber_05 
   bomber_06 
   bomber_07 
   bomber_08 
   bomber_09    bombers_spawned 	   FogOfWar    Reveal    underworld      @@   Prevent_AI_Usage    crusader_list    Find_All_Objects_Of_Type    Crusader_Gunship    Attack_Move        @      @    .  E     Α      E     A    E     Α    E     A    E     Α    E   Α         E   Α      G  E   Α        E   Α      Η  E   Α        E   Α       G  E   Α        E   Α      Η  E   Α        E   Α      G    FE    E  FE      FE  G  Ε  FE      FE  Η  E  FE      FE  G  Ε  FE      FE  Η  E  FE  	    G	  	  FH  
  A
 A
 Y 	  FH  
  A
 A
 Y 	  FH  
 E A
 A
 Y 	  FH  
  A
 A
 Y 	  FH  
 Ε A
 A
 Y 	  FH  
  A
 A
 Y 	  FH  
 E A
 A
 Y 	  FH  
  A
 A
 Y 	  FH  
 Ε A
 A
 Y 	  FH  
 	 A
 A
 Y   I   Y    I   Y  E  I   Y    I   Y  Ε  I   Y    I   Y  E  I   Y    I   Y  Ε  I   Y  	  I   Y    A   Η
    J  Ε
 FΕ Y    J  Ε
 FΚ Y  E  J  Ε
 Κ Y    J  Ε
 FΕ Y  Ε  J  Ε
 FΚ Y    J  Ε
 Κ Y  E  J  Ε
 FΕ Y    J  Ε
 FΚ Y  Ε  J  Ε
 Κ Y  	  J  Ε
 FΕ Y          A  Y  "      b   Η   ’     β   G  "    b  Η  ’    β  G    