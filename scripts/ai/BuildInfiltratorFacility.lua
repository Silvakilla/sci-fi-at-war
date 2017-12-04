require("pgevents")

function Definitions()
	Category = "Build_Infiltrator_Facility"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"Ground_Infiltrator_Facility = 1"
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
	ScriptExit()
end



