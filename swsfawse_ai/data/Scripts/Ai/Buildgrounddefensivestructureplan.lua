require("pgevents")


function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
--	Category = "Build_Ground_Defensive_Structure"
	Category = "AlwaysOff"
	IgnoreTarget = true
	TaskForce = {
	{
		"StructureForce",
		"E_Ground_Base_Shield | R_Ground_Base_Shield | Empire_Ground_Shutter_Shield | Rebel_Ground_Shutter_Shield | E_Galactic_Turbolaser_Tower_Defenses | R_Galactic_Turbolaser_Tower_Defenses | Ground_Magnepulse_Cannon = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function StructureForce_Thread()
	DebugMessage("%s -- In StructureForce_Thread.", tostring(Script))
	
	Sleep(1)
	
	StructureForce.Set_As_Goal_System_Removable(false)
	AssembleForce(StructureForce)
	
	StructureForce.Set_Plan_Result(true)
	DebugMessage("%s -- StructureForce done!", tostring(Script));
	ScriptExit()
end

function StructureForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end