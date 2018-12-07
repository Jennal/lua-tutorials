local t = {
	a = 1
}
setmetatable(t, {__index = t})

print(t.b)