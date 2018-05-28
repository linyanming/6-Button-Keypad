--[[=============================================================================
    Copyright 2016 Control4 Corporation. All Rights Reserved.
===============================================================================]]

-- This macro is utilized to identify the version string of the driver template version used.
if (TEMPLATE_VERSION ~= nil) then
	TEMPLATE_VERSION.device_specific_commands = "2016.01.08"
end

--[[=============================================================================
    ExecuteCommand Code

    Define any functions for device specific commands (EX_CMD.<command>)
    received from ExecuteCommand that need to be handled by the driver.
===============================================================================]]
--function EX_CMD.NEW_COMMAND(tParams)
--	LogTrace("EX_CMD.NEW_COMMAND")
--	LogTrace(tParams)
--end

function EX_CMD.BTNPRESS(tParams)
	LogTrace("EX_CMD.BTNPRESS")
	LogTrace(tParams)
	local buttonid = tParams["BUTTON_ID"]
	local cmd = {}
     cmd.BUTTON_ID = buttonid
     cmd.ACTION = 1
	NOTIFY.KEYPAD_BUTTON_ACTION(gKeypadProxy._BindingID,cmd)
	cmd.ACTION = 2
	NOTIFY.KEYPAD_BUTTON_ACTION(gKeypadProxy._BindingID,cmd)
end

function EX_CMD.RECVMSG(tParams)
    LogTrace("EX_CMD.RECVMSG")
	LogTrace(tParams)
	local msg = tParams["MESSAGE"]
	if(msg ~= nil and msg ~= "") then
	    gKeypadProxy:HandleMessage(msg)
	end
end