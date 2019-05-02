require("pgevents")

function Definitions()	
	Category = "Generate_Magic_Space_Defense"
	IgnoreTarget = true
	
	TaskForce = 
	{
		{
			"EmpireForce"
			,"DenyHeroAttach"
			,"Acclamator = 2"
			,"Venator = 1"
		},
		{
			"RebelForce"
			,"DenyHeroAttach"
			,"Rebel_Dreadnought = 2"
			,"Marauder_Missile_Cruiser = 2"
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
		EmpireForce.Set_Plan_Result(true)	
	elseif PlayerObject.Get_Faction_Name() == "Rebel" then
		RebelForce.Set_As_Goal_System_Removable(false)
		BlockOnCommand(RebelForce.Produce_Force(Target))
		RebelForce.Set_Plan_Result(true)	
	end
	
	Sleep(20)

	wait_start_time = GetCurrentTime()
	wait_duration = Determine_Magic_Wait_Duration()
	
	while (GetCurrentTime() - wait_start_time < wait_duration) and (EvaluatePerception("Needs_Magic_Space_Defense_Easy", PlayerObject, Target) == 0.0) do
		Sleep(1)
	end
	
	ScriptExit()
end