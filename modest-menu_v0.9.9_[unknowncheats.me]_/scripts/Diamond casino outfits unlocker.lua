local function mpx()
	return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end
 
menu.add_action("Unlock Diamond Casino Heist Outfits", function()
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL1", true, 63) -- Refuse Collectors
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 0) -- Undertakers
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 1) -- Valet Outfits
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 3) -- Prison Guards
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 4) -- FIB Suits
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 6) -- Gruppe Sechs Gear
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 7) -- Bugstars Uniforms
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 8) -- Maintenance
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 9) -- Yung Ancestors
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 10) -- Firefighter Gear
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 11) -- Orderly Armor
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 12) -- Upscale Armor
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 13) -- Evening Armor
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 14) -- Reinforced: Padded Combat
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 15) -- Reinforced: Bulk Combat
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 16) -- Reinforced: Compact Combat
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 17) -- Balaclava Crook
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 18) -- Classic Crook
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 19) -- High-end Crook
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 20) -- Infiltration: Upgraded Tech
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 21) -- Infiltration: Advanced Tech
	stats.set_bool_masked(mpx() .. "CASINOHSTPSTAT_BOOL2", true, 22) -- Infiltration: Modernized Tech
end)
 
-- DC: Rockstar Dev Jr#4828 | UC: CheatChris