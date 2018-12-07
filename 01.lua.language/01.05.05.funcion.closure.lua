function adder(base)
	local sum = base -- UpValue
	return function(i)
		sum = sum + i
		return sum
	end
end

local a1 = adder(1)
print(a1)
print(a1(0))
print(a1(1))
print(a1(2))
print()

local a2 = adder(2)
print(a2)
print(a2(0))
print(a2(1))