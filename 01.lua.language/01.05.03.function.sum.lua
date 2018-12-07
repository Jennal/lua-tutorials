function sum(...)
	local sum = 0
	for _,v in ipairs({...}) do
		sum = sum + v
	end

	return sum
end

print(sum(1, 2, 3))
print()

print(sum(
	unpack({
		1, 
		2, 
		3
	})
))
