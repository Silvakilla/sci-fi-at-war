require("pgevents")

ScriptPoolCount = 4

function Definitions()
	Category = "Build_Initial_Groundbase_Only | Build_Base_Component_Barracks"
	IgnoreTarget = true

	TaskForce = {
        {
            "BaseForce",
            "E_Ground_Barracks | R_Ground_Barracks | F_Ground_Barracks | K_Ground_Barracks = 1"
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

