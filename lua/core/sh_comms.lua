comms = comms or {}
comms.groupnames = comms.groupnames or {}
local groupnumber = 1
local jobnumber = 1

function comms_createCommsGroup(name, cmd, color, jobs)
    comms.groupnames[groupnumber] = {
        ["name"] = name,
        ["cmd"] = cmd,
        ["color"] = color,
        ["jobs"] = jobs,
        ["players"] = {}
    }
    groupnumber = groupnumber + 1
end

function comms_createGlobalGroup()
    for k, v in pairs(RPExtraTeams) do
       return v[jobnumber].name
    end
end