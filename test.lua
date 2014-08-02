require "Overload"

function functionToTest(a, b, c, d, e, f)
	if checkParameters({"string", "number", "boolean", "table", "function", "nil"}) then
		assert(type(a) == "string"
			and type(b) == "number"
			and type(c) == "boolean"
			and type(d) == "table"
			and type(e) == "function"
			and type(f) == "nil")
		return true
	else
		assert(type(a) ~= "string"
			or type(b) ~= "number"
			or type(c) ~= "boolean"
			or type(d) ~= "table"
			or type(e) ~= "function"
			or type(f) ~= "nil")
		return false
	end
end

print("Test Correct values")
assert(functionToTest("hi", 10, false, {}, function()end, nil))

print("Test wrong a")
assert(not functionToTest(nil, 10, false, {}, function()end, nil))

print("Test wrong b")
assert(not functionToTest("hi", nil, false, {}, function()end, nil))

print("Test wrong c")
assert(not functionToTest("hi", 10, nil, {}, function()end, nil))

print("Test wrong d")
assert(not functionToTest("hi", 10, false, nil, function()end, nil))

print("Test wrong e")
assert(not functionToTest("hi", 10, false, {}, nil, nil))

print("Test wrong f")
assert(not functionToTest("hi", 10, false, {}, function()end, 10))
