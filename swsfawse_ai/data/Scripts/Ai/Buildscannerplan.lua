require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Build_Scanner"
	IgnoreTarget = true
	TaskForce = {
	{
		"StructureForce",
		"Empire_Orbital_Long_Range_Scanner | Rebel_Orbital_Long_Range_Scanner | Empire_Heavy_Ship_Yard | Rebel_Heavy_Ship_Yard = 1"
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


