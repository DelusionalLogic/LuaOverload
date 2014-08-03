LuaOverload
============

A small simple script to help with "function overloading" and type checking in lua

Usage
------------

Simply ```require "Overload.lua"``` at the start of any lua script you want to use it in.
Whenever you define a function you want "type safe" (kinda) simply call ```checkParameters``` as the very first thing in the function.

The function takes 2 parameters. The first is a table containing the respective expected types of the parameters. This one is mandatory. The second is a list of respective default values to be used if the parameter value is nil. This parameter is mandatory.

The function will return true if all parameters matched the given type, or if there was no type given for the parameter. False otherwise.

A simple example can be seen here

```
require "Overload"

function testFunc(a, b, c)
	if checkParameters({"number", "string", "table"}, {nil, nil, {}}) then
		--Since we now know the type of the parameters this is safe
		table.insert(c, a)
		print(b, c[1])
	end
end

testFunc(10, "hello")
testFunc(10, 100)
```
You will will notice that c assumed its default value of ```{}```, and that we can avoid specifying a default value for a parameter by putting nil in the defaults array.

The script also contains common variances on the type names. A list of these variances can be seen below:
* nil
  * nil
  * null
* number
  * number
  * int
  * float
  * double
  * real
* boolean
  * bool
  * boolean
  * bit
* string
  * string
  * char
  * byte
* table
  * table
  * array
  * list
* function
  * function
  * method
* thread
  * thread
* userdata
  * userdata
  * user-data
  * memory
