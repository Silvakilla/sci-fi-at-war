require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Advance_Tech_Empire"
	IgnoreTarget = true
	TaskForce = {
	{
		"TechForce",
		"DS_Primary_Hyperdrive | DS_Shield_Gen | DS_Superlaser_Core | DS_Durasteel | Death_Star = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function TechForce_Thread()
	DebugMessage("%s -- In TechForce_Thread.", tostring(Script))

	Purge_Goals(PlayerObject)

	TechForce.Set_As_Goal_System_Removable(false)
	
	Sleep(1)
	
	BlockOnCommand(TechForce.Produce_Force())
	TechForce.Set_Plan_Result(true)
	
	DebugMessage("%s -- TechForce done!", tostring(Script));
	ScriptExit()
end

function TechForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end