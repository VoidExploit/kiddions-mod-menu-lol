
 
local MainNoClip = menu.add_submenu('NoClip') --creating submenu/folder, only used at the end of this lua file for information
local NoClipEnabled = false
local speed = 2
 
------------------------------------------------------------------------------
-------------------------------speed functions--------------------------------
	local function increasespeed()
		--if speed > 40 and speed == 45 then --speedlimit
		--	speed = 40
		--end
		if speed >= 1 and speed <= 5 then 
		speed = speed + 0.5
		end
			if speed > 5 and speed <= 10 then 
			speed = speed + 1
			end
				if speed > 10 and speed <= 25 then 
				speed = speed + 2.5
				end
					if speed > 25 then 
					speed = speed + 5
					end
		if speed >= 0.1 and speed < 1 then 
		speed = speed + 0.1
		end
	end
----
	local function decreasespeed()
		if speed >= 1 and speed <= 5 then 
			speed = speed - 0.5
		end
			if speed > 5 and speed <= 10 then 
				speed = speed - 1
			end
				if speed > 10 and speed <= 25 then
					speed = speed - 2.5
				end
					if speed > 25 then
						speed = speed - 5
					end
		if speed > 0.1 and speed <= 0.9 then 
			speed = speed - 0.1
		end
		if speed < 0.1 or speed == 0 then --underspeedlimit
			speed = 0.1
		end
	end
----
	local function resetspeed()
		if speed ~= 1 then 
			speed = 1
		end
	end
----
	local function bigspeed()
		speed = 10
	end
	
------------------------------------------------------------------------------
	
-----------------------------movement functions-------------------------------
	local function up()
		if not NoClipEnabled then return end
		local newpos = localplayer:get_position() + vector3(0,0,speed)
	 
		if not localplayer:is_in_vehicle() then
			localplayer:set_position(newpos)
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_position(newpos)
		end
	end
---- 
	local function down()
		if not NoClipEnabled then return end
		local newpos = localplayer:get_position() + vector3(0,0,speed * -1)
	 
		if not localplayer:is_in_vehicle() then
			localplayer:set_position(newpos)
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_position(newpos)
		end
	end
---- 
	local function forward()
		if not NoClipEnabled then return end
		local dir = localplayer:get_heading()
		local newpos = localplayer:get_position() + (dir * speed)
	 
		if not localplayer:is_in_vehicle() then
			localplayer:set_position(newpos)
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_position(newpos)
		end
	end
---- 
	local function backward()
		if not NoClipEnabled then return end
		local dir = localplayer:get_heading()
		local newpos = localplayer:get_position() + (dir * speed * -1)
	 
		if not localplayer:is_in_vehicle() then
			localplayer:set_position(newpos)
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_position(newpos)
		end
	end
---- 
	local function turnleft()
		if not NoClipEnabled then return end
		local dir = localplayer:get_rotation()
		
		if not localplayer:is_in_vehicle() then
			localplayer:set_rotation(dir + vector3(0.25,0,0))
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_rotation(dir + vector3(0.25,0,0))
		end
	end
---- 
	local function turnright()
		if not NoClipEnabled then return end
		local dir = localplayer:get_rotation()
		
		if not localplayer:is_in_vehicle() then
			localplayer:set_rotation(dir + vector3(0.25 * -1,0,0))
		else
			vehicle=localplayer:get_current_vehicle()
			vehicle:set_rotation(dir + vector3(0.25 * -1,0,0))
		end
	end
	
------------------------------------------------------------------------------
 
--------------------------Undead Offradar Function----------------------------
	local function GetUndeadOffradar()--Stealth noclip------------------------
		if localplayer == nil then
			return nil
		end
		
		max_health = localplayer:get_max_health()
		return max_health < 100.0
	end
	 
	local function SetUndeadOffradar(value)
		if value == nil or localplayer == nil then
			return
		end
		
		if value then
			max_health = localplayer:get_max_health()
			if max_health >= 100.0 then
				original_max_health = max_health
			end
			localplayer:set_max_health(0.0)
		else
			if original_max_health >= 100 then
				localplayer:set_max_health(original_max_health)
			else
				localplayer:set_max_health(328.0)
			end
		end
	end
	 
	--menu.add_toggle("Undead offradar", GetUndeadOffradar, SetUndeadOffradar)
	 
	--local function ToggleUndeadOffradar()
	--	value = GetUndeadOffradar()
	--	if value ~= nil then
	--		SetUndeadOffradar(not value)
	--	end
	--end
	
------------------------------------------------------------------------------
 
--------------------------------hotkey locals---------------------------------
	local up_hotkey
	local down_hotkey
	local up_hotkey2
	local down_hotkey2
	local forward_hotkey
	local backward_hotkey
	local turnleft_hotkey
	local turnright_hotkey
	local increasespeed_hotkey
	local decreasespeed_hotkey
	local resetspeed_hotkey
	local bigspeed_hotkey --set speed to 10
	
------------------------------------------------------------------------------
	
----------------------------Main NoClip Function------------------------------
	local function NoClip(e)
		if not localplayer then return end
		if e then 
			------------------------------------------------------------
			menu.set_big_map(true)          --turn on big map while nocliping to help with navigation
			------------------------------------------------------------
			value = GetUndeadOffradar()     --turn on stealth noclip (not visible on map zooming around)         
			if value ~= nil then
				SetUndeadOffradar(not value)
			end
			------------------------------------------------------------
			localplayer:set_freeze_momentum(true) --freeze momentum freezes the players movement velocity, it does not STOP the player, need fix kiddeon :/ if enable noclip while moving we just slide down any incline/slope like on ice
			localplayer:set_no_ragdoll(true)
			localplayer:set_config_flag(292,true)
			--
			up_hotkey = menu.register_hotkey(160, up)
			down_hotkey = menu.register_hotkey(162, down)
			up_hotkey2 = menu.register_hotkey(161, up)
			down_hotkey2 = menu.register_hotkey(163, down)
			--
			forward_hotkey = menu.register_hotkey(38, forward)
                       
			backward_hotkey = menu.register_hotkey(40, backward)
                        
			turnleft_hotkey = menu.register_hotkey(37, turnleft)
                       
			turnright_hotkey = menu.register_hotkey(39, turnright)
                      
			--
			increasespeed_hotkey = menu.register_hotkey(33, increasespeed)
			decreasespeed_hotkey = menu.register_hotkey(34, decreasespeed)
			--
			resetspeed_hotkey = menu.register_hotkey(48, resetspeed)
			bigspeed_hotkey = menu.register_hotkey(57, bigspeed)
			--
		else
			------------------------------------------------------------
			menu.set_big_map(false)         --turn off big map while nocliping
			------------------------------------------------------------
			value = GetUndeadOffradar()     --turn off stealth noclip (not visible on map zooming around)
			if value ~= nil then
				SetUndeadOffradar(not value)
			end
			------------------------------------------------------------
			localplayer:set_freeze_momentum(false) --freeze momentum freezes the players movement velocity, it does not STOP the player, need fix kiddeon :/ if enable noclip while moving we just slide down any incline/slope like on ice
			localplayer:set_no_ragdoll(false)
			localplayer:set_config_flag(292,false) --this does not stop the movement as well
			----------------------------------------------------
			localplayer:set_run_speed(0.01) --set run speed to minimum to not move that much when coming out of noclip
			menu.send_key_press(87)         --send a w (move forward) keystroke when coming out of noclip to actually spawn visible and with physics
			localplayer:set_run_speed(1)    --turn run speed back to normal
			----------------------------------------------------
			menu.remove_hotkey(up_hotkey)
			menu.remove_hotkey(down_hotkey)
			menu.remove_hotkey(up_hotkey2)
			menu.remove_hotkey(down_hotkey2)
                       
                
                       
			menu.remove_hotkey(forward_hotkey)
			menu.remove_hotkey(backward_hotkey)
			menu.remove_hotkey(turnleft_hotkey)
			menu.remove_hotkey(turnright_hotkey)
			menu.remove_hotkey(increasespeed_hotkey)
			menu.remove_hotkey(decreasespeed_hotkey)
			menu.remove_hotkey(resetspeed_hotkey)
			menu.remove_hotkey(bigspeed_hotkey)
			speed = 1   --reset speed to 1 default after 
			end         --ending noclip for more predictable behaviour
	end
	
------------------------------------------------------------------------------
	
------------------------------------Menu--------------------------------------
	MainNoClip:add_toggle("NoClip", function()  --the ingame on/off toggle, could be disabled by deleting, or commenting out, i prefer commenting out tho
		return NoClipEnabled                    --sometimes the insert key does not work, so this option is good to have in the menu, as this works more consistent
	end, function()                             --restarting the mod menu, by closing it in mainwindow>settings>quit menu and restarting the .exe fixes the keybind not working
		NoClipEnabled = not NoClipEnabled 
		NoClip(NoClipEnabled)
	end)
----
	--MainNoClip:add_int_range("NoClip Speed", 1, 1, 10, function()
	--	return speed
	--end, function(i) speed = i end)
----
	 menu.register_hotkey(46, function() --insert to turn off or on noclip function
		NoClipEnabled = not NoClipEnabled 
		NoClip(NoClipEnabled)
	 end)
----
	--Menu Hotkey Information--
	local function Text(submenu, text) --text function for submenu
		MainNoClip:add_action(text, function() end)
		print('APPENDING TEXT ' .. text)
	end
----
	Text(MainNoClip, 'On/Off = DEL') 
	Text(MainNoClip, 'Forward = Arrow Up')
	Text(MainNoClip, 'Backward = Arrow Down')
	Text(MainNoClip, 'Turn Left = Arrow Left')
	Text(MainNoClip, 'Turn Right = Arrow Right')
	Text(MainNoClip, 'Up = LShift/RShift')
	Text(MainNoClip, 'Down = LCntrl/RCntrl')
	Text(MainNoClip, 'Increase Speed = Pageup')
	Text(MainNoClip, 'Decrease Speed = Pagedown')
	Text(MainNoClip, 'Reset Speed to 1 = 0/zero')
	Text(MainNoClip, 'Set Speed to 10 = 9')
