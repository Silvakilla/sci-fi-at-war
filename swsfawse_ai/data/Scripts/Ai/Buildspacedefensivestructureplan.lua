require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Build_Space_Defensive_Structure"
	IgnoreTarget = true
	TaskForce = {
	{
		"StructureForce",
		"E_Orbital_Jamming_Station | R_Orbital_Jamming_Station | Ground_Ion_Cannon | Ground_Empire_Hypervelocity_Gun | Rebel_Medium_Ship_Yard | Empire_Medium_Ship_Yard = 1"
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