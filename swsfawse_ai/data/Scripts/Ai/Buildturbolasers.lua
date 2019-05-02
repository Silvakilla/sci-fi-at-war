require("pgevents")

function Definitions()	
	Category = "Build_Turbolasers"
	IgnoreTarget = true
	TaskForce = {
	{
		"StructureForce",
		"E_Galactic_Turbolaser_Tower_Defenses | R_Galactic_Turbolaser_Tower_Defenses | Rebel_Medium_Ship_Yard | Empire_Medium_Ship_Yard = 1"
	}
	}
end

function StructureForce_Thread()
	
	Sleep(1)
	
	StructureForce.Set_As_Goal_System_Removable(false)
	AssembleForce(StructureForce)
	
	StructureForce.Set_Plan_Result(true)
	ScriptExit()
end

function StructureForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end