require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	IgnoreTarget = true;
	Category = "Weaken_Planet"
	TaskForce = {
	{
		"SmugglerForce",						
		"DenyHeroAttach",
		"Smuggler_Team_E | Smuggler_Team_R = 1"
	}
	}
	
	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function SmugglerForce_Thread()
	DebugMessage("%s -- In SmugglerForce_Thread.", tostring(Script))
	
	if EvaluatePerception("Suitable_Smuggler_Target", PlayerObject, Target) < 0.5 then
		ScriptExit()
	end
	
	Sleep(1)

	AssembleForce(SmugglerForce)
	Sleep(1)
	BlockOnCommand(SmugglerForce.Move_To(Target))
	
	SmugglerForce.Set_Plan_Result(true)	
	LandUnits(SmugglerForce)
	
	DebugMessage("%s -- SmugglerForce Done!  Exiting Script!", tostring(Script))
	ScriptExit()
end

function SmugglerForce_No_Units_Remaining()
	ScriptExit()
end