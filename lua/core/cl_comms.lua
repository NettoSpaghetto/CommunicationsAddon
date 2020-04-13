local white = Color(255,255,255)
local group
local orgply
local plytext

hook.Add( "OnPlayerChat", "commsCmds", function(ply, text, public )
    for k, v in pairs(comms.groupnames) do
        for i = 1, #v.jobs do
            if v.jobs[i] == team.GetName(ply:Team()) then
                local command = string.sub(string.lower(text), 1, string.len(v.cmd) + 1)
                if command == ("/" .. v.cmd) then
                    net.Start("commsMessage")
                    net.WriteString(text)
                    net.SendToServer(ply)
                    return true
                end
            end
        end
    end
end)

net.Receive("commsChatPrint", function()
    group = net.ReadTable()
    orgply = net.ReadEntity()
    plytext = net.ReadString()
    chat.AddText(group.color, "[" .. group.name .. "] " .. orgply:Nick(), white, ": ", string.sub(plytext, string.len(group.cmd) + 2, string.len(plytext)))
end)
