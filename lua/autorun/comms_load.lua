
if SERVER then
    util.AddNetworkString("commsMessage")
	util.AddNetworkString("commsChatPrint")
	include ("core/sv_comms.lua")
end

local function comms_Load(fdir)
	local files, dirs = file.Find(fdir .. "*", "LUA")

	for _, afile in ipairs(files) do
		if string.match(afile, ".lua") then
			print(" [[Communcations]] - Loaded File: " .. afile)

			if SERVER then
				AddCSLuaFile(fdir .. afile)
			end

			include(fdir .. afile)
		end
	end

	for _, dir in ipairs(dirs) do
		comms_Load(fdir .. dir .. "/")
	end
end

comms_Load("core/")
comms_Load("config/")