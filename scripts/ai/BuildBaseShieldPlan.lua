require("pgevents")

function Definitions()
	Category = "Build_Base_Shield"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"E_Ground_Base_Shield | R_Ground_Base_Shield | = 1"
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





