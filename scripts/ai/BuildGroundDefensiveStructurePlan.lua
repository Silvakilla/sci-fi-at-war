require("pgevents")

function Definitions()
	Category = "AlwaysOff"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			E_Ground_Base_Shield |
			R_Ground_Base_Shield |
			F_Ground_Base_Shield |
			K_Ground_Base_Shield |
			Empire_Ground_Shutter_Shield |
			Rebel_Ground_Shutter_Shield |
			F_Ground_Shutter_Shield |
			K_Ground_Shutter_Shield |
			E_Galactic_Turbolaser_Tower_Defenses |
			R_Galactic_Turbolaser_Tower_Defenses |
			F_Galactic_Turbolaser_Tower_Defenses |
			K_Galactic_Turbolaser_Tower_Defenses |
			Ground_Magnepulse_Cannon
			= 1"
		}
	}

end

function StructureForce_Thread()
	Sleep(1)
	StructureForce.Set_As_Goal_System_Removable(false)
	AssembleForce(StructureForce)
	StructureForce.Set_Plan_Result(true)
	ScriptExit()
end

function StructureForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end