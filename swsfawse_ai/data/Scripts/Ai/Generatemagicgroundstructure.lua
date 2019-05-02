require("pgevents")

function Definitions()	
	Category = "Generate_Magic_Ground_Structure"
	IgnoreTarget = true
	
	TaskForce = 
	{
		{
			"ReserveForce"
			,"DenyHeroAttach"
			,"E_Galactic_Turbolaser_Tower_Defenses | R_Galactic_Turbolaser_Tower_Defenses | E_Ground_Advanced_Vehicle_Factory | E_Ground_Heavy_Vehicle_Factory | R_Ground_Heavy_Vehicle_Factory | E_Ground_Light_Vehicle_Factory | R_Ground_Light_Vehicle_Factory = 1"	
		}
	}
	
	AllowFreeStoreUnits = false
	MagicPlan = true
	MagicPlanStealing = false
end

function ReserveForce_Thread()		
	ReserveForce.Set_As_Goal_System_Removable(false)
	BlockOnCommand(ReserveForce.Produce_Force(Target))
	Sleep(40)
	ScriptExit()
end