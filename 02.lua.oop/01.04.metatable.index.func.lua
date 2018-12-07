local pos = {
	x = 0,
	y = 0
}

-- pos['mt']
pos.mt = {
	__index = function(t, k)
		print('__index', t, k)
		return rawget(t, k)
	end;
	__newindex = function(t, k, v)
		print('__newindex', t, k, v)
		rawset(t, k, v)
		return t[k]
	end;
}

setmetatable(pos, pos.mt);

print(pos)
print(pos.x, pos.y, pos.z)
pos.z = 2

pos.z = 3
print(pos.x, pos.y, pos.z)