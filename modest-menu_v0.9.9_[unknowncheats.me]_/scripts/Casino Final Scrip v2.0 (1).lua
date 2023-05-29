local casino_menu = menu.add_submenu("★★★Casino Heist Final v2.0 ★★★")
PlayerIndex = globals.get_int(1574918)

	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
 
local function Text(text)
	menu.add_action(text, function() end)
end

PrepMenu = casino_menu:add_submenu("⫸Skip Heist Preps")
local function Text(text)
	casino_menu:add_action(text, function() end)
end
local function Text(text)
	PrepMenu:add_action(text, function() end)
end
local function Text(text)
	PrepMenu:add_action(text, function() end)
end

Text("--------➤Set Primary Target◄---------")
 
PrepMenu:add_int_range("Target - Cash1/Gold2/Art3/Diam4", 1, 1, 4, function() return stats.get_int(mpx .. "H3OPT_TARGET") end, function(TGT)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
	if TGT == 1 then
		H3t = 0
	elseif TGT == 2 then
		H3t = 1
	elseif TGT == 3 then
		H3t = 2
	elseif TGT == 4 then
		H3t = 3
	end
		stats.set_int(mpx .. "H3OPT_TARGET", H3t)
end)
 
PrepMenu:add_int_range("Random Approach - Normal/Hard", 1, 1, 2, function() return 1 end, function(H3lvl)
	LstAp = stats.get_int(mpx .. "H3_LAST_APPROACH")
	HrdAp = stats.get_int(mpx .. "H3_HARD_APPROACH")
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
	if H3lvl == 2 then
		Apr = HrdAp
	else
		if LstAp == 2 and HrdAp == 3 then
		Apr = 1
		elseif LstAp == 3 and HrdAp == 2 then
		Apr = 1
		elseif LstAp == 3 and HrdAp == 1 then
		Apr = 2
		elseif LstAp == 1 and HrdAp == 3 then
		Apr = 2
		else
		Apr = 3
		end
	end
		stats.set_int(mpx .. "H3OPT_APPROACH", Apr)
end)
 
PrepMenu:add_int_range("EasyApproach - Snk/BgCon/Aggr", 1, 1, 3, function() return 1 end, function(Approach)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
	if Approach == 1 then
		LastApproach = 3
		HardApproach = 2
		Weapon = 1
	elseif Approach == 2 then
		LastApproach = 3
		HardApproach = 1
		Weapon = 0
	else
		LastApproach = 1
		HardApproach = 2
		Weapon = 0
	end
		stats.set_int(mpx .. "H3_LAST_APPROACH", LastApproach)
		stats.set_int(mpx .. "H3_HARD_APPROACH", HardApproach)
		stats.set_int(mpx .. "H3OPT_APPROACH", Approach)
end)
 
PrepMenu:add_int_range("HardApproach - Snk/BgCon/Aggr", 1, 1, 3, function() return stats.get_int(mpx .. "H3_HARD_APPROACH") end, function(Approach)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
	if Approach == 1 then
		LastApproach = 3
		HardApproach = 1
	elseif Approach == 2 then
		LastApproach = 3
		HardApproach = 2
	else
		LastApproach = 1
		HardApproach = 3
	end
		stats.set_int(mpx .. "H3_LAST_APPROACH", LastApproach)
		stats.set_int(mpx .. "H3_HARD_APPROACH", Approach)
		stats.set_int(mpx .. "H3OPT_APPROACH", Approach)
end)
 
PrepMenu:add_action("--------➤Confirm Board 1◄-------------", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		stats.set_int(mpx .. "H3OPT_BITSET1", -1)
end)
 
PrepMenu:add_int_range("Hacker - Rickie 3%/Avi 10%/Paige 9%", 1, 1, 3, function() return stats.get_int(mpx .. "H3OPT_CREWHACKER") end, function(Hkr)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
	if Hkr == 1 then
		H3Hcr = 1
	elseif Hkr == 2 then
		H3Hcr = 4
	else
		H3Hcr = 5
	end
		stats.set_int(mpx .. "H3OPT_CREWHACKER", H3Hcr)
end)
 

PrepMenu:add_int_range("Grlla/Clwn/Anml9/Riot/OniF/Hockey", 1, 1, 12, function() return stats.get_int(mpx .. "H3OPT_MASKS") end, function(H3Msk)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
--	hMsk = H3Msk
		stats.set_int(mpx .. "H3OPT_MASKS", H3Msk)
end)

PrepMenu:add_int_range("Weap-Karl/Gus/Char/Ches/Pat", 1, 1, 5, function() return stats.get_int(mpx .. "H3OPT_CREWWEAP") end, function(H3Weap)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
--	hWeap = H3Weap
		stats.set_int(mpx .. "H3OPT_CREWWEAP", H3Weap)
end)
 
PrepMenu:add_action("--------➤Confirm Board 2◄-------------", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		stats.set_int(mpx .. "H3OPT_DISRUPTSHIP", 3)
		stats.set_int(mpx .. "H3OPT_KEYLEVELS", 2)
		stats.set_int(mpx .. "H3OPT_CREWWEAP", 1)
		stats.set_int(mpx .. "H3OPT_CREWDRIVER", 1)
		stats.set_int(mpx .. "H3OPT_VEHS", 3)
		stats.set_int(mpx .. "H3OPT_WEAPS", 0)
		stats.set_int(mpx .. "H3OPT_BITSET0", -129)
end)
 
local function Text(text)
	PrepMenu:add_action(text, function() end)
end

local function Text(text)
	menu.add_action(text, function() end)
end

local DPCO=1966533 + 1497 + 736 + 92 
local CSK=1973320 + 823 + 56 	
local mpx = stats.get_int("MPPLY_LAST_MP_CHAR")
local Weapon = 0
local function Text(text)
	PrepMenu:add_action(text, function() end)
end
smMenu = casino_menu:add_submenu("⫸Set Cuts")
 
smMenu:add_int_range("Casino Player1 Cut", 5.0, 15, 179, function() 
	return globals.get_int(1970895+2325+1)
end, function(value)
	globals.set_int(1970895+2325+1, value)
H3C1 = p1
end)
 
smMenu:add_int_range("Casino Player2 Cut", 5.0, 15, 179, function() 
	return globals.get_int(1970895+2325+1+1)
end, function(value)
	globals.set_int(1970895+2325+1+1, value)
H3C2 = p2

end)
 
smMenu:add_int_range("Casino Player3 Cut", 5.0, 15, 179, function() 
	return globals.get_int(1970895+2325+1+1+1)
end, function(value)
	globals.set_int(1970895+2325+1+1+1, value)
H3C3 = p3

end)
 
smMenu:add_int_range("Casino Player4 Cut", 5.0, 15, 179, function() 
	return globals.get_int(1970895+2325+1+1+1+1)
end, function(value)
	globals.set_int(1970895+2325+1+1+1+1, value)
H3C4 = p4

end)

smMenu:add_int_range(" Paige - CrewCut", 5.0, 0, -19, function() 
	return globals.get_int(262145 + 28819)
end, function(value)
	globals.set_int(262145 + 28819, value)

end)

smMenu:add_int_range(" Karl CrewCut2", 5.0, 0, -19, function() 
	return globals.get_int(262145 + 28805)
end, function(value)
	globals.set_int(262145 + 28805, value)
end)

smMenu:add_int_range(" Karim - CrewCut4", 5.0, 0, -19, function() 
	return globals.get_int(262145 + 28810)
end, function(value)
	globals.set_int(262145 + 28810, value)
end)

smMenu:add_int_range(" Lester - CrewCut5", 5.0, 0, -19, function() 
	return globals.get_int(262145 + 28791)
end, function(value)
	globals.set_int(262145 + 28791, value)


end)

local function Text(text)
	PrepMenu:add_action(text, function() end)
end
HMenu = casino_menu:add_submenu("⫸Heist Tools")
require_game_build(2845)
local STRKM52=52962;
HMenu:add_action("Crack Casino Fingerprint", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM52) == 3 or heist_script:get_int(STRKM52) == 4 then
			heist_script:set_int(STRKM52, 5)
		end
	end
end)
require_game_build(2845)
local STRKM51=54024;
HMenu:add_action("Crack Casino Keypads", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM51) >= 3 or heist_script:get_int(STRKM51) < 100 then
			heist_script:set_int(STRKM51, 5)
		end
	end
end)

	local mpx = stats.get_int("MPPLY_LAST_MP_CHAR")
	local Heist1 = script("fm_mission_controller")
        local Heist1Life = 26133 + 1325 + 1
        HMenu:add_int_range("Mission life", 1, 0, 99, function()
		return Heist1:get_int(Heist1Life)
end, function(value)
	Heist1:set_int(Heist1Life, value)
end)


HSRT=22393
function HS()return script("fm_mission_controller")end
HMenu:add_int_range("Real Take>", 100000, 150000, 4438000, function() if HS():is_active() then return HS():get_int(HSRT) else return 0 end end, function(RTv) 
	if HS():is_active() then HS():set_int(HSRT, RTv) end
end)

local function Text(text)
	CoolMenu:add_action(text, function() end)
end
CoolMenu = casino_menu:add_submenu("⫸Cooldown Killer")
CoolMenu:add_action("Casino Cooldown Killer", function()
	mpIndex = globals.get_int(1574918)
	if mpIndex == 0 then
		stats.set_int("MP0_H3_COMPLETEDPOSIX", 0)
                stats.set_int("MP0_H3_COOLDOWN", 0)
                stats.set_int("MP0_H3_COOLDOWN_HARD", 0)
	else
		stats.set_int("MP1_H3_COMPLETEDPOSIX", 0)
                stats.set_int("MP1_H3_COOLDOWN", 0)
                stats.set_int("MP1_H3_COOLDOWN_HARD", 0)
	end
end)
local function Text(text)
	smMenu:add_action(text, function() end)
end
Text("--------------> By thizissam.in <----------------")