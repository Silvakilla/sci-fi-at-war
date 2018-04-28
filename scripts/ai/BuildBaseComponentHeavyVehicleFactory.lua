require("pgevents")

function Definitions()
	Category = "Build_Base_Component_Heavy_Vehicle_Factory"
	IgnoreTarget = true

	TaskForce = {
		{
			"BaseForce",
			"E_Ground_Heavy_Vehicle_Factory | R_Ground_Heavy_Vehicle_Factory = 1"
		}
	}
end

function BaseForce_Thread()
	Sleep(1)
	AssembleForce(BaseForce)
	BaseForce.Set_Plan_Result(true)
	ScriptExit()
end

function BaseForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end



