local connections = {}
local connectionsFunction = {}

local services = require(script.Parent.Parent.Bundles.services)

function connectionsFunction.add(connection)
    table.insert(connections, connection)
end
function connectionsFunction.deleteConnections()
    for i,v in connections do
        if typeof(v) == "function" then
            v()
        else
            v:Disconnect()
        end
        connections[i] = nil
    end
end

return connectionsFunction