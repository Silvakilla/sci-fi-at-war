require("pgevents")

function Definitions()
	Category = "Build_Jamming_Station"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			R_Orbital_Jamming_Station |
			E_Orbital_Jamming_Station |
			F_Orbital_Jamming_Station |
			K_Orbital_Jamming_Station |
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




