if debug == nil then
	error("Overload.lua requires the debug library")
end

local deviations = {
	["nil"] = {
		"nil",
		"null",
	},
	["number"] = {
		"number",
		"num",
		"int",
		"float",
		"double",
		"real",
	},
	["boolean"] = {
		"bool",
		"boolean",
		"bit",
	},
	["string"] = {
		"string",
		"str",
		"char",
		"byte",
	},
	["table"] = {
		"table",
		"tbl",
		"array",
		"list",
	},
	["function"] = {
		"function",
		"func",
		"method",
	},
	["thread"] = {
		"thread",
	},
	["userdata"] = {
		"userdata",
		"user-data",
		"memory"
	}
}

local function typesEqual(typeName, identifier)
	if deviations[typeName] == nil then
		error("Type is not lua type: " .. typeName)
	end
	if type(identifier) == "string" then identifier = {identifier} end

	for _,v in ipairs(deviations[typeName]) do
		for _,v2 in ipairs(identifier) do
			if v:lower() == v2:lower() then
				return true
			end
		end
	end
	return false
end

function checkParameters(parameterList, defaultList)
	if debug.getinfo(2, "f") == nil then
		error("Called from outside function")
	end

	local paramNum = 1
	while true do
		local name, value = debug.getlocal(2, paramNum)
		if name == nil then break end

		if value == nil and defaultList ~= nil then
			debug.setlocal(2, paramNum, defaultList[paramNum])
			value = defaultList[paramNum]
		end
		if parameterList[paramNum] ~= nil and not typesEqual(type(value), parameterList[paramNum]) then
			return false
		end
		paramNum = paramNum + 1
	end
	return true
end
