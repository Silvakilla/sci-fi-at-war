require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Advance_Tech_Rebel"
	IgnoreTarget = true
	TaskForce = {
	{
		"TechForce",
		"DenyHeroAttach",
		"Droids_Team = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function TechForce_Thread()
	DebugMessage("%s -- In TechForce_Thread.", tostring(Script))
	
	TechForce.Set_As_Goal_System_Removable(false)
	
	Target = FindTarget(TechForce, "Is_Good_Slice_Target", "Enemy", 0.1)
	
	if not Target then
		DebugMessage("%s -- Unable to find target for TechForce!", tostring(Script))
		ScriptExit()
	end
	
	BlockOnCommand(TechForce.Produce_Force(Target))
		
	BlockOnCommand(TechForce.Move_To(Target))
		
	BlockOnCommand(LandUnits(TechForce))
	TechForce.Set_Plan_Result(true)	
	
	DebugMessage("%s -- TechForce done!", tostring(Script));
	ScriptExit()
end

function TechForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end