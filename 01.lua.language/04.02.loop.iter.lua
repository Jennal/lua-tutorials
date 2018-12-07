local iter = function(t) 
	local i = 0
	return function()
		i = i + 1
		return t[i], 1, 2, 3
	end
end
for v, i, j, k in iter({1, 2, 3}) do
	print("for v", v, i, j, k)
end
print()