require("pgtaskforce")

ScriptPoolCount = 2

function Definitions()
	GlobalContrastScale = 3.0
	PerFailureContrastAdjust = 0.5
	
	Category = "Conquer_Opponent"
	TaskForce = {
		{
			"MainForce"
			,"MinimumTotalSize = 10"
			,"MinimumTotalForce = 8000"
			, "Infantry | Vehicle | Air | Fighter | Bomber | Corvette | Frigate | Super | Capital = 100%"
		}
	}

	RequiredCategories =	{ "Infantry", "Corvette | Frigate | Capital | Super" }
	difficulty = "Easy"

	if PlayerObject then
		difficulty = PlayerObject.Get_Difficulty()
	end

	sleep_duration = DifficultyBasedMinPause(difficulty)
	LandSecured = false
end

function MainForce_Thread()

	if difficulty == "Easy" or difficulty == "Normal" then
		ScriptExit()
	end

	MainForce.Set_Plan_Result(true)	
	
	if MainForce.Are_All_Units_On_Free_Store() == true then
		AssembleForce(MainForce)
	else
		BlockOnCommand(MainForce.Produce_Force());
		return
	end
	
	BlockOnCommand(MainForce.Move_To(Target))
	
	if MainForce.Get_Force_Count() == 0 then
		MainForce.Set_Plan_Result(false)	
		Sleep(sleep_duration)
		ScriptExit()
	end
	
	if Invade(MainForce) == false then
		MainForce.Set_Plan_Result(false)			
		Sleep(sleep_duration)
		ScriptExit()
	end

	MainForce.Set_As_Goal_System_Removable(false)	
	MainForce.Test_Target_Contrast(false)
	FundBases(PlayerObject, Target)
	LandSecured = true
	MainForce.Release_Forces(1.0)

	if  (not GalacticAttackAllowed(difficulty, 2)) then
		Sleep(sleep_duration)
	end

	ScriptExit()
end

function MainForce_Production_Failed(failed_object_type)
	ScriptExit()
end

function MainForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)
	if new_owner ~= PlayerObject and new_owner.Is_Neutral() == false then
		if (not LandSecured) or (PlayerObject.Get_Difficulty() == "Hard") then
			ScriptExit()
		end
	end
end

function MainForce_No_Units_Remaining()
	if not LandSecured then
		MainForce.Set_Plan_Result(false)
	end
end
