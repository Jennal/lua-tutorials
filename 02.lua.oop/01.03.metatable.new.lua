--local new_pos = {}
print(new_pos, 1)

function add(a, b)
	print(new_pos, 2)
	local p = new_pos( 
		a.x + b.x,
		a.y + b.y
	)

	return p
end

local pos_mt = {
	__add = add
}

print(new_pos, 4.1)
function new_pos(x, y)
	print(new_pos, 3)
	local o = {x=x, y=y}
	setmetatable(o, pos_mt);
	return o
end
print(new_pos, 4)

local p1 = new_pos(1, 2);
print(new_pos, 5)
local p2 = new_pos(1, 2);
print(p1.x, p1.y)

p1 = p1 + p2
print(p1.x, p1.y)
print()

p1 = p1 + p2
print(p1.x, p1.y)