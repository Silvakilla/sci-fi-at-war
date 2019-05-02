require("pgevents")

function Definitions()	
	Category = "Generate_Magic_Ground_Defense_Easy"
	IgnoreTarget = true
	
	TaskForce = 
	{
		{
			"EmpireForce"
			,"DenyHeroAttach"
			,"Imperial_Stormtrooper_Squad = 2"
		},
		{
			"RebelForce"
			,"DenyHeroAttach"
			,"Rebel_Infantry_Squad = 1"
			,"Rebel_Tank_Buster_Squad = 1"
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
			(EvaluatePerception("Needs_Magic_Ground_Defense_Easy", PlayerObject, Target) == 0.0) do
		Sleep(1)
	end
	
	ScriptExit()
end