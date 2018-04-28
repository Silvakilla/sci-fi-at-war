require("pgevents")

function Definitions()
	Category = "Build_Economic_Structure"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"Rebel_Ground_Mining_Facility | Empire_Ground_Mining_Facility | = 1"
		}
	}
end

function StructureForce_Thread()
	Sleep(1)
	AssembleForce(StructureForce)
	StructureForce.Set_Plan_Result(true)
	ScriptExit()
end

function StructureForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end