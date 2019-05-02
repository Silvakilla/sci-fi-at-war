require("pgevents")

ScriptPoolCount = 4

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Build_Initial_Groundbase_Only | Build_Base_Component_Barracks"
	IgnoreTarget = true
	TaskForce = {
	{
		"BaseForce",
		"E_Ground_Barracks | R_Ground_Barracks | Empire_UNSC_Barracks | Rebel_UNSC_Barracks | Empire_COV_Ground_Barracks | Rebel_COV_Ground_Barracks = 1"
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

