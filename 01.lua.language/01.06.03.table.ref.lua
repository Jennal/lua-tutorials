local t = {
	a = 1,
	b = 2,
	[1] = 3
}
for k,v in pairs(t) do
	print(k,v)
end
print()

local t2 = t
t2[2] = 4

for k,v in pairs(t) do
	print(k,v)
end