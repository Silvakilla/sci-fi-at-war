require("pgevents")

ScriptPoolCount = 4

function Definitions()
	Category = "Build_Space_Forces"
	IgnoreTarget = true

	TaskForce = {
		{
			"ReserveForce",
			"DenyHeroAttach",
			"Corvette = 0,4",
			"Frigate = 0,4",
			"Capital = 0,4"
		}
	}

	RequiredCategories = { "Corvette | Frigate | Capital" }
	AllowFreeStoreUnits = false
end

function ReserveForce_Thread()	
	ReserveForce.Set_As_Goal_System_Removable(false)
	BlockOnCommand(ReserveForce.Produce_Force())
	ReserveForce.Set_Plan_Result(true)
end
