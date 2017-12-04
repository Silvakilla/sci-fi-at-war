require("pgevents")

function Definitions()	
	Category = "Build_Turbolasers"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			E_Galactic_Turbolaser_Tower_Defenses |
			R_Galactic_Turbolaser_Tower_Defenses |
			F_Galactic_Turbolaser_Tower_Defenses |
			K_Galactic_Turbolaser_Tower_Defenses |
			Empire_Light_Ship_Yard |
			Rebel_Light_Ship_Yard |
			Empire_Medium_Ship_Yard |
			Rebel_Medium_Ship_Yard |
			Empire_Heavy_Ship_Yard |
			Rebel_Heavy_Ship_Yard
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