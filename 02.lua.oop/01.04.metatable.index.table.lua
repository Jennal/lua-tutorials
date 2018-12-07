local pos = {
	x = 0,
	y = 0
}

pos.mt = {
	__index = {
		z = 1
	};
	__newindex = function(t, k, v)
		print('__newindex', t, k, v)
		rawset(t, k, v)
		return t[k]
	end;
}

setmetatable(pos, pos.mt);

print(pos.x, pos.y, pos.z)
pos.z = 2
print(pos.x, pos.y, pos.z)
pos.z = 1
print(pos.x, pos.y, pos.z)
pos.z = nil
print(pos.x, pos.y, pos.z)

return pos