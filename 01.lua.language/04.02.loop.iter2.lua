local iter = function(t) 
	return function(t, i)
		i = i + 1
		if t[i] then
			return i + 1, t[i], 2, 3
		end

		return nil
	end, t, 0
end
for i, v, j, k in iter({1, 2, 3}) do
	print("for v", i, v, j, k)
end
print()