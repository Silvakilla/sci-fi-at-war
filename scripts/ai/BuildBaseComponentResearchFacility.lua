require("pgevents")

function Definitions()
	Category = "Build_Base_Component_Research_Facility | Build_Base_Component_Research_Facility_2"
	IgnoreTarget = true

	TaskForce = {
		{
			"BaseForce",
			"E_Ground_Research_Facility | F_Ground_Research_Facility | K_Ground_Research_Facility = 1"
		}
	}
end

function BaseForce_Thread()
	Sleep(1)
	BaseForce.Set_As_Goal_System_Removable(false)
	AssembleForce(BaseForce)
	BaseForce.Set_Plan_Result(true)
	ScriptExit()
end

function BaseForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end


