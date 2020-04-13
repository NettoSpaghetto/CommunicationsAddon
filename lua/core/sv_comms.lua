local text
local chatprinttable = chatprinttable or {}

hook.Add("OnPlayerChangedTeam", "commsJobTable", function(ply, before, after)
	for i = 1, #comms.groupnames do
		for j = 1, #comms.groupnames[i].jobs do
			if comms.groupnames[i].jobs[j] == team.GetName(after) then
				table.insert(comms.groupnames[i].players, ply)
			else
				table.RemoveByValue(comms.groupnames[i].players, ply)
			end
		end
	end
end)

net.Receive("commsMessage", function(len, orgply)
	text = net.ReadString()
	int = net.ReadInt(3)
	if !orgply:IsValid() then return end
	for a, b in pairs(comms.groupnames) do
		for k, v in pairs(b.players) do
			net.Start("commsChatPrint")
			net.WriteTable(b)
			net.WriteEntity(orgply)
			net.WriteString(text)
			net.Send(v)
		end
	end
end)