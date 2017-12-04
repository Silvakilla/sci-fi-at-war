require("pgevents")

ScriptPoolCount = 4

function Definitions()
	MinContrastScale = 1.25
	MaxContrastScale = 1.75

	Category = "Conquer_Opponent"
	TaskForce = {
		{
			"SpaceForce"
			,"MinimumTotalSize = 4"
			,"MinimumTotalForce = 2500"
			,"Frigate | Capital | Corvette | Bomber | Fighter = 100%"
		},
		{
			"GroundForce"
			,"MinimumTotalSize = 4"
			,"MinimumTotalForce = 750"
			,"Vehicle | Infantry | Air = 100%"
		}
	}

	RequiredCategories = { "Infantry", "Corvette | Frigate | Capital | Super" }

	PerFailureContrastAdjust = 0.5
	SpaceSecured = true
	LandSecured = false
	MovingGroundForceToTarget = false
	WasConflict = false
	difficulty = "Easy"

	if PlayerObject then
		difficulty = PlayerObject.Get_Difficulty()
	end

    sleep_duration = DifficultyBasedMinPause(difficulty)
end

function SpaceForce_Thread()
	SpaceForce.Set_Plan_Result(true)
	SpaceSecured = false

	if SpaceForce.Are_All_Units_On_Free_Store() == true then
		AssembleForce(SpaceForce)
	else
		BlockOnCommand(SpaceForce.Produce_Force());
		return
	end

	if SpaceForce.Get_Force_Count() == 0 then
		if EvaluatePerception("Is_Good_Ground_Grab_Target", PlayerObject, Target) == 0 then
			ScriptExit()
		else
			SpaceSecured = true
		end
	else
		BlockOnCommand(SpaceForce.Move_To(Target))
		WasConflict = true
		if SpaceForce.Get_Force_Count() == 0 then
			SpaceForce.Set_Plan_Result(false)		
			Exit_Plan_With_Possible_Sleep()
		end
				
		SpaceSecured = true
		
		while not LandSecured do
			Sleep(5)
		end
		
		SpaceForce.Release_Forces(1.0)
	end
end

function GroundForce_Thread()
	GroundForce.Set_Plan_Result(true)	
	
	if GroundForce.Are_All_Units_On_Free_Store() == true then
		AssembleForce(GroundForce)
	else
		BlockOnCommand(GroundForce.Produce_Force());
		return
	end
	
	LandUnits(GroundForce)
	
	while not SpaceSecured do
		if WasConflict then
			Exit_Plan_With_Possible_Sleep()
		end
		Sleep(5)
	end
	
	if not LaunchUnits(GroundForce) then
		Exit_Plan_With_Possible_Sleep()
	end
		
	if EvaluatePerception("Is_Good_Ground_Grab_Target", PlayerObject, Target) == 0 then
		Exit_Plan_With_Possible_Sleep()
	end	
	
	MovingGroundForceToTarget = true
	BlockOnCommand(GroundForce.Move_To(Target))	
	MovingGroundForceToTarget = false
	WasConflict = true	

    if Invade(GroundForce) == false then
		GroundForce.Set_Plan_Result(false)
		Exit_Plan_With_Possible_Sleep()
	end

	GroundForce.Set_As_Goal_System_Removable(false)	
	GroundForce.Test_Target_Contrast(false)
	LandSecured = true
	GroundForce.Release_Forces(1.0)
	FundBases(PlayerObject, Target)
	Exit_Plan_With_Possible_Sleep()
end

function Exit_Plan_With_Possible_Sleep()
	if SpaceForce then
		SpaceForce.Release_Forces(1.0)
	end

    GroundForce.Release_Forces(1.0)

    if WasConflict and (not GalacticAttackAllowed(difficulty, 2)) then
		Sleep(sleep_duration)
	end

    ScriptExit()
end

function SpaceForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end

function GroundForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end

function SpaceForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)
	if new_owner ~= PlayerObject and new_owner.Is_Neutral() == false then
		if (not LandSecured) or (PlayerObject.Get_Difficulty() == "Hard") then
			ScriptExit()
		end
	end
end

function GroundForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)
	if new_owner ~= PlayerObject and new_owner.Is_Neutral() == false then
		if (not LandSecured) or (PlayerObject.Get_Difficulty() == "Hard") then
			ScriptExit()
		end
	end
end

function SpaceForce_No_Units_Remaining()
	if not LandSecured then
		SpaceForce.Set_Plan_Result(false)
	end
end

function GroundForce_No_Units_Remaining()
	if not LandSecured then
		GroundForce.Set_Plan_Result(false)
	end
end