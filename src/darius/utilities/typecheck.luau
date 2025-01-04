return function(variables:table, correctVariables:table, ignoreList:table?):any
    ignoreList = ignoreList or {}
    local didPass = true
    local itemsThatFailed = {}
    for key, correctType in correctVariables do
        if (variables[key] == nil or typeof(variables[key]) ~= typeof(correctType)) and not table.find(ignoreList, key) then
            didPass = false
            table.insert(itemsThatFailed,`{key} expected: {typeof(correctType)} got: {typeof(variables[key])}`)
        end
    end
    return didPass, itemsThatFailed
end