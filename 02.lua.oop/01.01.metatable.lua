local pos = {
	x = 0,
	y = 0
}

print(getmetatable(pos))

-- operator+(...)
local mt = {
	__add = function(a, b)
		local p = { 
			x = a.x + b.x,
			y = a.y + b.y
		}
		-- setmetatable(p, mt);

		return p
	end
	--[[
		__sub    => a - b
		__mul    => a * b
		__div    => a / b
		__mod    => a % b
		__pow    => a ^ b
		__unm    => -a
		__concat => a .. b
		__len    => #a
		__eq     => a == b
		__lt     => a < b
		__le     => a <= b
		__index  => a[b] | a.b
		__newindex => a[b] | a.b
		__call   => a()
		__tostring => print(a)
	--]]
}

local p1 = {x=2, y=1};
print(pos.x, pos.y)

-- try this
-- pos = pos + p1

setmetatable(pos, mt);
-- pos = pos + p1
pos = pos + p1
print(pos.x, pos.y)

-- try again
-- pos = pos + p1
-- print(pos.x, pos.y)