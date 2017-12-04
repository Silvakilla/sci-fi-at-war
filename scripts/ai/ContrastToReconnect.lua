require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Conquer_To_Reconnect"
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

	RequiredCategories = { "Infantry", "Corvette | Frigate | Capital | Super" }		--Must have at least one ground unit, also make sure space force is reasonable
	PerFailureContrastAdjust = 0.5
	SpaceSecured = true
	LandSecured = false
	InSpaceConflict = false
	WasConflict = false
	sleep_duration = 150
end

function SpaceForce_Thread()
	SpaceForce.Set_Plan_Result(true)
	SpaceSecured = false

	if SpaceForce.Are_All_Units_On_Free_Store() == true then
		SynchronizedAssemble(SpaceForce)
		WasConflict = true
	else
		BlockOnCommand(SpaceForce.Produce_Force());
		return
	end

	if SpaceForce.Get_Force_Count() == 0 then
		if EvaluatePerception("Is_Good_Ground_Grab_Target", PlayerObject, Target) == 0 then
			SpaceForce.Set_Plan_Result(false)
		else
			SpaceSecured = true
		end
	else
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
		while not SpaceSecured do
			Sleep(5)
		end

		SynchronizedAssemble(GroundForce)
	else
		BlockOnCommand(GroundForce.Produce_Force());
		return
	end
		
	WasConflict = true
	if Invade(GroundForce) == false then
		DebugMessage("%s -- Curses...The invasion failed!  Exiting Script!", tostring(Script))
	end

	LandSecured = true
	GroundForce.Release_Forces(1.0)
	GroundForce.Set_Plan_Result(true)
	FundBases(PlayerObject, Target)
end

function Exit_Plan_With_Possible_Sleep()
	if SpaceForce then
		SpaceForce.Release_Forces(1.0)
	end
	GroundForce.Release_Forces(1.0)
	if WasConflict then
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

function GroundForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)
	if new_owner ~= PlayerObject and new_owner.Is_Neutral() == false then
		if (not LandSecured) or (PlayerObject.Get_Difficulty() == "Hard") then
			ScriptExit()
		end
	end
end

function SpaceForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)
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

