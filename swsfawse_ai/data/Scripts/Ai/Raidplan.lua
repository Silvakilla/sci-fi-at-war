require("pgevents")

function Definitions()	

	Category = "Raid"
	
	TaskForce = {
	{
		"RaidForce"
		,"DenyHeroAttach"
		,"Infantry | Vehicle | Air = 2"
		,"LandHero = 0,1"
	}
	}	
	
	LandSecured = false
	
	difficulty = "Easy"
	if PlayerObject then
		difficulty = PlayerObject.Get_Difficulty()
	end
	sleep_duration = DifficultyBasedMinPause(difficulty)
end

function RaidForce_Thread()
    
	AssembleForce(RaidForce)
		
	if not RaidForce.Is_Raid_Capable() then
		ScriptExit()
	end
			
	RaidForce.Set_Plan_Result(true)
	
	if not LaunchUnits(RaidForce) then
		ScriptExit()
	end
		
	BlockOnCommand(RaidForce.Raid(Target))

	RaidForce.Set_As_Goal_System_Removable(false)	
	RaidForce.Test_Target_Contrast(false)	

	if RaidForce.Get_Force_Count() == 0 then
		Sleep(sleep_duration)
		ScriptExit()
	end

	LandSecured = true
	RaidForce.Release_Forces(1.0)
			
	FundBases(PlayerObject, Target)
	
	if (not GalacticAttackAllowed(difficulty, 1)) then
		Sleep(sleep_duration)
	end
	ScriptExit()
end

function RaidForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end

function RaidForce_Original_Target_Owner_Changed(tf, old_owner, new_owner)	
	if new_owner ~= PlayerObject and new_owner.Is_Neutral() == false then
		if (not LandSecured) or (PlayerObject.Get_Difficulty() == "Hard") then
			ScriptExit()
		end
	end
end

function RaidForce_No_Units_Remaining(tf)
	ScriptExit()
end