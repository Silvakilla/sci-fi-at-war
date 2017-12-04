require("pgevents")

function Definitions()
	Category = "Build_Base_Component_Officer_Academy"
	IgnoreTarget = true

	TaskForce = {
		{
			"BaseForce",
			"E_Ground_Officer_Academy | R_Ground_Officer_Academy | F_Ground_Officer_Academy | K_Ground_Officer_Academy = 1"
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



