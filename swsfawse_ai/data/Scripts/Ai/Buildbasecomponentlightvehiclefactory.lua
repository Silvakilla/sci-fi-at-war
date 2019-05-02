require("pgevents")

ScriptPoolCount = 4

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Build_Base_Component_Light_Vehicle_Factory | Build_Initial_Groundbase_Only"
	IgnoreTarget = true
	TaskForce = {
	{
		"BaseForce",
		"E_Ground_Light_Vehicle_Factory | R_Ground_Light_Vehicle_Factory | Empire_UNSC_Ground_Vehicle_Factory | Rebel_UNSC_Ground_Vehicle_Factory | Empire_COV_Ground_Vehicle_Factory | Rebel_COV_Ground_Vehicle_Factory = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function BaseForce_Thread()
	DebugMessage("%s -- In BaseForce_Thread.", tostring(Script))
	
	Sleep(1)

	AssembleForce(BaseForce)
	
	BaseForce.Set_Plan_Result(true)
	DebugMessage("%s -- BaseForce done!", tostring(Script));
	ScriptExit()
end

function BaseForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end