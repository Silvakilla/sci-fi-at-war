require("pgevents")

function Definitions()
	Category = "Build_Scanner"
	IgnoreTarget = true

	TaskForce = {
		{
			"StructureForce",
			"
			Empire_Orbital_Long_Range_Scanner |
			Rebel_Orbital_Long_Range_Scanner |
			F_Orbital_Long_Range_Scanner |
			K_Orbital_Long_Range_Scanner |
			Empire_Light_Ship_Yard |
			Rebel_Light_Ship_Yard |
			Empire_Medium_Ship_Yard |
			Rebel_Medium_Ship_Yard
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


