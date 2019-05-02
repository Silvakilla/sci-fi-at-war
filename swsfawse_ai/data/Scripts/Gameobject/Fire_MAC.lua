require("PGStateMachine")

function Definitions()

	ServiceRate = 1

	Define_State("State_Init", State_Init);
	Define_State("State_AI_Autofire", State_AI_Autofire)
	Define_State("State_Human_No_Autofire", State_Human_No_Autofire)
	Define_State("State_Human_Autofire", State_Human_Autofire)
	
	unit_trigger_number = 2
	threat_trigger_number = 4000
	mac_range = 5000
	ability_name = "BLAST"
end

function State_Init(message)
	if message == OnEnter then

		-- prevent this from doing anything in galactic mode
		if Get_Game_Mode() ~= "Space" then
			ScriptExit()
		end

		nearby_unit_count = 0
		nearby_unit_threat = 0
		recent_enemy_units = {}

		Register_Prox(Object, Unit_Prox, mac_range)
		
		if Object.Get_Owner().Is_Human() then
			Set_Next_State("State_Human_No_Autofire")
		else
			Set_Next_State("State_AI_Autofire")
		end
	end
end

function State_AI_Autofire(message)
	if message == OnUpdate then
		if nearby_unit_threat >= threat_trigger_number then
			Try_Ability(Object, ability_name)
		end	
		
		-- reset tracked units each service.
		nearby_unit_count = 0
		nearby_unit_threat = 0
		recent_enemy_units = {}
	end		
	
end

function State_Human_No_Autofire(message)
	if message == OnUpdate then
		if Object.Is_Ability_Autofire(ability_name) then
			Set_Next_State("State_Human_Autofire")
		end
		
		-- reset tracked units each service.
		nearby_unit_count = 0
		nearby_unit_threat = 0
		recent_enemy_units = {}
		
	end
end

function State_Human_Autofire(message)
	if message == OnUpdate then
	
		if Object.Is_Ability_Autofire(ability_name) then
			if nearby_unit_count > 2 then
				Object.Activate_Ability(ability_name, true)
			end
		else
			Set_Next_State("State_Human_No_Autofire")
		end
		
		-- reset tracked units each service.
		nearby_unit_count = 0
		nearby_unit_threat = 0
		recent_enemy_units = {}
			
	end				
end

-- If an enemy enters the prox, han may want to chase them down for stun
function Unit_Prox(self_obj, trigger_obj)
	
	if not trigger_obj.Get_Owner().Is_Enemy(Object.Get_Owner()) then
		return
	end
	
	--Promote to parent object (fighter squadron) for unit counting purposes
	if trigger_obj.Get_Parent_Object() then
		trigger_obj = trigger_obj.Get_Parent_Object()
	end
	
	--Ignore targets that are too close to be hit by the MAC
	if self_obj.Get_Distance(trigger_obj) < 500.0 then
		return
	end

	-- If we haven't seen this unit recently, track him
	if recent_enemy_units[trigger_obj] == nil then
		nearby_unit_count = nearby_unit_count + 1
		recent_enemy_units[trigger_obj] = trigger_obj
		nearby_unit_threat = nearby_unit_threat + trigger_obj.Get_Type().Get_Combat_Rating()
	end
end