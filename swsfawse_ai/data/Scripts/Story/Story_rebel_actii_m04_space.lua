LupQ		Ά	hηυ}A   =(none)                             require    PGStoryMode    Definitions    State_Rebel_A2_M04_Begin    Intro_Cinematic    Ending_Cinematic    State_End_Cinematic_Camera    Prox_Waypoint    Prox_Final_Waypoint    Spawn_Star_Destroyers    Prox_Shuttle_Rescue    Antillies_Destroyed    Shuttle_Needs_Rescue    Shuttle_Destroyed    Start_Service_Calls    Story_Mode_Service    Handle_Shuttle_Rescue_Thread        0                     5      DebugMessage    %s -- In Definitions 	   tostring    Script    StoryModeEvents    Rebel_A2_M04_Begin    State_Rebel_A2_M04_Begin %   Rebel_A2_M04_All_Shuttles_Rescued_03    State_End_Cinematic_Camera    convoy_escort_type    ACCLAMATOR_ASSAULT_SHIP    TIE_FIGHTER_SQUADRON    convoy_escort_markers 	   capital4    tiefighter5    tiefighter6    tiefighter7    tiefighter8 
   capital11    tiefighter12    tiefighter13    tiefighter18    tiefighter19    tiefighter24    tiefighter25    shuttle_markers    shuttletyderium2    shuttletyderium3    shuttletyderium9    shuttletyderium10    shuttletyderium14    shuttletyderium15    star_destroyer_markers 
   cruiser22    star_destoyers    VICTORY_DESTROYER    start_service_calls    shuttles_rescued            total_shuttles       @   player_notified    counter_shuttle_needs_rescue       π?   counter_shuttles_disabled    unit 
   new_units    convoy_escorts    star_destroyers    sundered_heart    flag_all_shuttles_disabled    flag_mission_over    fog_id     Z      A    Ε   Y       I  I   
   Α Α Α Α  Α Α Α 	Α 
Α Α ί  G  
  A  Α  A  Α  A 	 
Α  ί    
   Α  A  Α _  G  
   A _     
  Α Α _        	  	  G	  
  Η	  	  G
  Α
  
  	       G          Η          G          Η                                 G      OnEnter    rescued_shuttle_goto 
   Find_Hint    GENERIC_MARKER_SPACE    rescued-shuttle-goto 
   waypoint1 
   waypoint2 
   waypoint3 
   waypoint4    waypoint4a 
   waypoint5    waypoint5a 
   waypoint6 
   waypoint7    waypoint7a 
   waypoint8 
   waypoint9    destroyer_arrival 
   cruiser17    MessageBox -   Error - Could not find all waypoint markers.    empire    Find_Player    Empire    rebel    Rebel    neutral_player    Neutral    fog_id 	   FogOfWar    Reveal_All 	   ref_type    Find_Object_Type    SHUTTLE_TYDERIUM_PRISONERS    pairs    shuttle_markers    spawn_marker 
   new_units    Spawn_Unit    Prevent_AI_Usage "   Mark_Parent_Mode_Object_For_Death    Move_To    Register_Death_Event    Shuttle_Destroyed    convoy_escorts    convoy_escort_markers    convoy_escort_type    table    insert    ACCLAMATOR_ASSAULT_SHIP    Guard_Target    Find_Nearest    Override_Max_Speed       π?   prox_range      ΐr@   Register_Prox    Prox_Waypoint    Prox_Final_Waypoint       i@   Register_Timer    Spawn_Star_Destroyers       ^@   Start_Service_Calls       @   Find_All_Objects_Of_Type    SUNDERED_HEART    sundered_heart    Antillies_Destroyed    Create_Thread    Intro_Cinematic     M    U   R   Α   G    Α  A G   Α      Α  Α Η   Α      Α  A G   Α      Α  Α Η   Α      Α  A G   Α      Α  Α Η   Α      Α   G E  T    Ε  Τ    E  T      Τ E     T Ε     X Τ  Ε  Y    Α  G  A    Α   E Ζ     A  Η  Ε Y^  Α    	 	 XT  E 	 	 Ε 	 E  G	  E	 YήFH	 
Y 	H	Y 	ΖH	E 
Y 	
 	  
Ε
 Y	]  Tό ]  Τφ 
    E Y^  Α    	 	 XT  E 	   Ζ  Η 	 Ε 	 E  G	  E	 YΕ 	Κ	 
  Y	FH	 
Y 	H	Y 	 	Ζ	ΥΚT K	Ε 
  A 
Y  	K	A 
Y 	  ΖH	E 
Y 	]  ψ ]  Τρ Α   E E  E Y  E  E Y Ε E  E Y  E  E Y E E  E Y  E  E Y Ε E  E Y  E  E Y E E  E Y  E  E Y Ε E  E Y   Α E Y E  Y Ε  YE   G	 E	   E	 ΖΛ Η 
 Ε  YE  Y       ω         
            '      Suspend_AI       π?   Lock_Controls    Letter_Box_In            Point_Camera_At    sundered_heart    shuttle 
   Find_Hint    GENERIC_MARKER_SPACE    shuttletyderium9    Start_Cinematic_Camera    Sleep       @   Fade_Screen_In        @   Set_Cinematic_Camera_Key       @      @      ΐ     K@     Kΐ   Set_Cinematic_Target_Key       Y@      I@    Transition_Cinematic_Camera_Key       @       ΐ   Story_Event    M04_INTRO_DIALOG_01_GO      @@      N@      Nΐ   Fade_Screen_Out       ΰ?   Transition_To_Tactical_Camera    End_Cinematic_Camera    Letter_Box_Out    M04_INTRO_DIALOG_02_GO     l      A  Y     A  Y  Ε    Y  E   Y    A   Η  Ε  Y    A Y    Α Y    Ε A Α A A   A   Y   Ε Α       Y E  Ε  A Α A A   A   	Y    A  Y    A Y     Y    Ε    A   A   Y    Y  E   Y     Y  Ε   Y  	  Y  E	   Y      Y      Y  E   Y     Y    	 Y        1        
            +      Sleep        @   Story_Event    ALL_SHUTTLES_RESCUED    Fade_Screen_Out       ΰ?   Suspend_AI       π?   Lock_Controls    Letter_Box_In            sundered_heart 	   warp_loc 
   Find_Hint    GENERIC_MARKER_SPACE    warploc 	   exit_pos    ATTACKER ENTRY POSITION    attacker-entry    Start_Cinematic_Camera    Fade_Screen_In    Set_Cinematic_Camera_Key      @@      $@      $ΐ      N@   Set_Cinematic_Target_Key       4@      4ΐ    Transition_Cinematic_Camera_Key       @     ΐ@      @     [@      1@      d@   rebel    Find_Player    Rebel    Start_Cinematic_Space_Retreat    Get_ID        @      (@    ]      A  Y     Α  Y    A Y    Α Y    Α Y  E   Y  Ε  X       E   Α    E  A     Ε  Y    A  Y  E     A Α  Α  Y           Y E    Α  A Α  Α  	Y  E    Α  Α Α  Α  	Y  E	  	   	  Ε	  	 Θ  A
 Y    
 Y        Y                         OnEnter    Fade_Screen_Out        @   Sleep    End_Cinematic_Camera          U   Τ E    Y Ε    Y  Y       c                         trigger_type 	   Get_Type 	   Get_Name    SHUTTLE_TYDERIUM_PRISONERS    ACCLAMATOR_ASSAULT_SHIP    VICTORY_DESTROYER 
   waypoint1    Move_To 
   waypoint2 
   waypoint3 
   waypoint4    waypoint4a 
   waypoint5    waypoint5a 
   waypoint6 
   waypoint7    waypoint7a    player_notified            flag_all_shuttles_disabled       π?   Story_Event    SHUTTLE_ESCAPED 
   waypoint8 
   waypoint9     _   ΖΎ  ?     U?T   ?    Υ? Τ       Fΐ  Y       Fΐ E Y E      Fΐ  Y       Fΐ Ε Y Ε      Fΐ  Y       Fΐ E Y E      Fΐ  Y       Fΐ Ε Y Ε      Fΐ  Y        U?  E C Τ Ε X   G E  Y Fΐ Ε Y Ε      Fΐ  Y                                Hyperspace_Away        Ύ Y         	                        Story_Event    DESTROYERS_INBOUND    spawn_marker 
   Find_Hint    GENERIC_MARKER_SPACE    marker_name 
   new_units 
   SpawnList    star_destoyers    destroyer_arrival    empire    pairs    Prevent_AI_Usage "   Mark_Parent_Mode_Object_For_Death    Move_To 
   waypoint1           A  Y  Ε    E     Ε   E         Ε   Y ή Α Y ΖΑY ΒΕ Y ]   Tύ       ₯  
                       sundered_heart    Cancel_Event_Object_In_Range    Prox_Shuttle_Rescue    Create_Thread    Handle_Shuttle_Rescue_Thread               Ζ>   Y Ε      Y      ±                          flag_mission_over    Story_Event    ANTILLIES_DESTROYED           X     E     Y        Ή                      
   TestValid    counter_shuttle_needs_rescue       π?   Story_Event    SHUTTLE_NEEDS_RESCUE_1        @   SHUTTLE_NEEDS_RESCUE_2                E  Ώ   Ε   Y E  Ώ G   E  ΥΏ  T Ε   Y E  Ώ G        Ζ                          flag_mission_over    Story_Event    SHUTTLES_LOST           X     E     Y        Π                          start_service_calls                   Φ        	            %      start_service_calls    flag_all_shuttles_disabled    ywing_total    Find_All_Objects_Of_Type    Y-Wing 
   TestValid       π?   shuttle_list    SHUTTLE_TYDERIUM_PRISONERS    pairs    Is_Under_Effects_Of_Ability    Ion_Cannon_Shot    Story_Event    NOT_ENOUGH_YWINGS 
   Get_Owner    rebel    Change_Owner    Move_To    Get_Position    Set_Selectable 
   Highlight    Register_Prox    Prox_Shuttle_Rescue      ΐR@   Register_Timer    Shuttle_Needs_Rescue       .@   counter_shuttles_disabled            SHUTTLE_DISABLED1    SHUTTLE_DISABLED2        @   SHUTTLE_DISABLED3       @   SHUTTLE_DISABLED4       @   CANCEL_NOT_ENOUGH_YWINGS           X       E   X    Ε         E    ΐ   X    Ε      Η  E  Ε Y  ΑΑ  X Τ   A Y T  ]   ύ Ε      Η  E  Ε Y  E    T ΑΑ    Β Ε UΤ ΒΕ Y ΖΒΓ Y  FΓ  Y Γ Y E   Α Ε Y E   Y Ε E  Ε @Η  A Y  Ε @  Ε @Η   Y  Ε UF  Ε @Η   Y  Ε ΥF  Ε @Η   Y   Ε @Η Ε UG Τ  	 Y  G  T  ]   θ                                shuttles_rescued       π?   total_shuttles    flag_mission_over    Create_Thread    Ending_Cinematic    Story_Event    1_SHUTTLE_RESCUED        @   2_SHUTTLES_RESCUED       @   3_SHUTTLES_RESCUED       @   4_SHUTTLES_RESCUED       @   5_SHUTTLES_RESCUED 
   Highlight    Make_Invulnerable    Prevent_AI_Usage    Prevent_All_Fire    Attach_Particle_Effect    Rescue_Effect    Sleep 	   Teleport    rescued_shuttle_goto    Move_To    Hide    Stop     M     ΜΎ       W  T  Η   A Y T   ΥΎ  Τ   Α Y    ΐ  Τ   A Y Τ   Α  Τ   Α Y    Α  Τ   A Y T   Β     Α Y B   Y ΖB  Y C  Y FC  Y C A Y  A  Y FD  Y ΖD  Y E  Y FE Y   "      A  Y  "      b   Η   ’     β   G  "    b  Η  ’    β  G  "    b  Η  ’    β  G  "    b  Η  ’      