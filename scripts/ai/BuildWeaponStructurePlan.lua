require("pgevents")

function Definitions()
	Category = "Build_Weapon"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			Ground_Ion_Cannon |
			Ground_Empire_Hypervelocity_Gun |
			Ground_Magnepulse_Cannon |
			Ground_Gravity_Generator
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





