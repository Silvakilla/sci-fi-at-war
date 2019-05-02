require("pgevents")

function Definitions()	
	Category = "Generate_Magic_Ground_Defense_Hard"
	IgnoreTarget = true
	
	TaskForce = 
	{
		{
			"EmpireForce"
			,"DenyHeroAttach"
			,"Imperial_Stormtrooper_Squad = 4"
			,"Imperial_Heavy_Assault_Company = 2"
			,"Imperial_Heavy_Scout_Squad = 2"
			,"Imperial_Shocktrooper_Squad = 3"
		},
		{
			"RebelForce"
			,"DenyHeroAttach"
			,"Rebel_Light_Elite_Infantry_Squad = 2"
			,"Rebel_Tank_Buster_Squad = 2"
			,"Rebel_Light_Tank_Brigade = 2"
			,"Rebel_Heavy_Tank_Brigade = 1"
			,"AAC_Tank_Company = 1"
		}
	}
	
	AllowFreeStoreUnits = false
	MagicPlan = true
	MagicPlanStealing = false
end

function ReserveForce_Thread()		
	if PlayerObject.Get_Faction_Name() == "Empire" then
		EmpireForce.Set_As_Goal_System_Removable(false)
		BlockOnCommand(EmpireForce.Produce_Force(Target))
		LandUnits(EmpireForce)
		EmpireForce.Set_Plan_Result(true)	
	elseif PlayerObject.Get_Faction_Name() == "Rebel" then
		RebelForce.Set_As_Goal_System_Removable(false)
		BlockOnCommand(RebelForce.Produce_Force(Target))
		LandUnits(RebelForce)
		RebelForce.Set_Plan_Result(true)	
	end
	
	Sleep(20)
	
	wait_start_time = GetCurrentTime()
	wait_duration = Determine_Magic_Wait_Duration()
	
	while (GetCurrentTime() - wait_start_time < wait_duration) and 
			(EvaluatePerception("Needs_Magic_Ground_Defense_Hard", PlayerObject, Target) == 0.0) do
		Sleep(1)
	end
	
	ScriptExit()
end