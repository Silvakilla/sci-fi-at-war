require("pgevents")

function Definitions()
	Category = "AlwaysOff"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			-- "Ground_Hutt_Palace_E | Ground_Hutt_Palace_R = 1"
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


