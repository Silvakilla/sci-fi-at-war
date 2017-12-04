require("pgevents")

ScriptPoolCount = 4

function Definitions()
	Category = "Build_Cantina"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			Ground_Cantina_E |
			Ground_Cantina_R |
			F_Ground_Cantina |
			K_Ground_Cantina
			= 1"
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