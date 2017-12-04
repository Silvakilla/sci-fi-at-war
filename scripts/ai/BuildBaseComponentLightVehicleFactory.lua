require("pgevents")

ScriptPoolCount = 4

function Definitions()
	Category = "Build_Base_Component_Light_Vehicle_Factory | Build_Initial_Groundbase_Only"
	IgnoreTarget = true

	TaskForce = {
		{
			"BaseForce",
			"E_Ground_Light_Vehicle_Factory | R_Ground_Light_Vehicle_Factory | F_Ground_Light_Vehicle_Factory | K_Ground_Light_Vehicle_Factory = 1"
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


