local pos = {
	x = 0,
	y = 0
}

function pos:add(p)
	self.x = self.x + p.x
	self.y = self.y + p.y

	return self
end

pos.__tostring = function(t)
	return string.format("(%d, %d)", t.x, t.y)
end

pos.new = function(self)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

local p1 = pos:new()
local p2 = pos:new()

print(p1, p2)
p1.x = 1
p2.y = 2
print(p1, p2)
print()

for k,v in pairs(p1) do
	print(k,v)
end
print()

print(p1:add(p2))
--[[
p1.add(p1, p2)
p1['add'](p1, p2)
]]
print()

for k,v in pairs(p1) do
	print(k,v)
end