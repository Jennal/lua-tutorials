--[[
while
repeat
for
--]]

for i,v in ipairs({
	a = 2,
	b = 3,
	[1] = 2,
	[3] = 4
}) do
	print(i, v)
end
print()

for k,v in pairs({
	a = 2,
	b = 3,
	[1] = 2,
	[3] = 4
}) do
	print(k, v)
end