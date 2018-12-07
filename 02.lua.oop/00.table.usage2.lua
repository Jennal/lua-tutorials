local pos = {
	x = 0,
	y = 0,
}

-- pos.add = function() ... end
function pos.add(p1, p2)
	p1.x = p1.x + p2.x
	p1.y = p1.y + p2.y

	return p1
end

local speed = {x=1, y=2}

print(pos.x, pos.y)
pos = pos.add(pos, speed)
print(pos.x, pos.y)

-- pos = pos.add(pos, speed)
pos = pos:add(speed)
print(pos.x, pos.y)

-- function pos.minus(self, p2)
function pos:minus(p2)
	self.x = self.x - p2.x
	self.y = self.y - p2.y

	return self
end

print()
print(pos.x, pos.y)
pos = pos.minus(pos, speed)
print(pos.x, pos.y)

pos = pos:minus(speed)
print(pos.x, pos.y)