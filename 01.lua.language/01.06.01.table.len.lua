local t = {}
print('t = {}\n', table.getn(t), #t)
print()

t[2] = 2
print('t[2] = 2\n', table.maxn(t), table.getn(t), #t)
print(t[1], t[2])
print()

for k,v in pairs(t) do
	print(k,v)
end