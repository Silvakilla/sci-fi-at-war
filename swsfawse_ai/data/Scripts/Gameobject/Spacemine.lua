require("PGStateMachine")

function Definitions()

	ServiceRate = 1

	Define_State("State_Init", State_Init);
	Define_State("State_AI_Autofire", State_AI_Autofire)
	Define_State("State_Human_No_Autofire", State_Human_No_Autofire)
	Define_State("State_Human_Autofire", State_Human_Autofire)
	
	nearby_unit_count = 0
	unit_trigger_number = 2
	threat_trigger_number = 100
	ability_range = 350
	ability_name = "SELF_DESTRUCT"
	
	recent_enemy_units = {}
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

		Register_Prox(Object, Unit_Prox, ability_range)
		
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
		if nearby_unit_threat >= threat_trigger_number then
			Try_Ability(Object, ability_name)
		end
		
		-- reset tracked units each service.
		nearby_unit_count = 0
		nearby_unit_threat = 0
		recent_enemy_units = {}
		
	end
end

function State_Human_Autofire(message)
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


-- If an enemy enters the prox, han may want to chase them down for stun
function Unit_Prox(self_obj, trigger_obj)
	
	if not trigger_obj.Get_Owner().Is_Enemy(Object.Get_Owner()) then
		return
	end
	
	--Promote to parent object (fighter squadron) for unit counting purposes
	if trigger_obj.Get_Parent_Object() then
		trigger_obj = trigger_obj.Get_Parent_Object()
	end

	-- If we haven't seen this unit recently, track him
	if recent_enemy_units[trigger_obj] == nil then
		nearby_unit_count = nearby_unit_count + 1
		recent_enemy_units[trigger_obj] = trigger_obj
		nearby_unit_threat = nearby_unit_threat + trigger_obj.Get_Type().Get_Combat_Rating()
	end
end
