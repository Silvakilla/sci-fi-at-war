require("pgevents")

function Definitions()
	Category = "Build_Base_Component_Comm_Array"
	IgnoreTarget = true

	TaskForce = {
		{
			"BaseForce",
			"Communications_Array_E | Communications_Array_R | F_Communications_Array | K_Communications_Array = 1"
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


