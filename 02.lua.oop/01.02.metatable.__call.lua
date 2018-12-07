local pos = {
	x = 0,
	y = 0
}

pos.mt = {
	__call = function(...)
		print("Pos called!", ...)
	end
}
setmetatable(pos, pos.mt);

print(pos)
pos(1, 2, 3)