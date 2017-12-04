require("pgevents")

function Definitions()
	
	Category = "Lift_Blockade"

	TaskForce = {
		{
			"MainForce"
			,"MinimumTotalSize = 4"
			,"MinimumTotalForce = 2500"
			,"Frigate | Capital | Corvette | Fighter | Bomber = 100%"
		}
	}

	RequiredCategories = { "Corvette | Frigate | Capital | Super" }	
end

function MainForce_Thread()
	SynchronizedAssemble(MainForce)

	if MainForce.Get_Force_Count() > 0 then
		MainForce.Set_Plan_Result(true)
		MainForce.Release_Forces(1.0)
	end
	
	Sleep(120)
	ScriptExit()
end

function MainForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end

function MainForce_No_Units_Remaining()
	MainForce.Set_Plan_Result(false)
end
