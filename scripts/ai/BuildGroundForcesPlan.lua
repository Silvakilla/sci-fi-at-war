require("pgevents")

function Definitions()	
	Category = "Build_Ground_Forces"
	IgnoreTarget = true
	
	TaskForce = {
		{
			"ReserveForce",
			"Infantry = 0,2",
			"Vehicle = 0,2",
			"Air = 0,2",
			"-F9TZ_Cloaking_Transport_Company",
			"-HAV_Juggernaut_Company",
			"-Gallofree_HTT_Company",
			"-Field_Com_Rebel_Team",
			"-Field_Com_Empire_Team"
		}
	}

	RequiredCategories = { "Vehicle" }
	AllowFreeStoreUnits = false
end

function ReserveForce_Thread()		
	ReserveForce.Set_As_Goal_System_Removable(false)
	BlockOnCommand(ReserveForce.Produce_Force())
	ReserveForce.Set_Plan_Result(true)	
end
