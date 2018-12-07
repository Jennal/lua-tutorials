local n = 3
while n > 0 do
	print("while n", n)
	n = n - 1
end
print()

n = 3
local a = 1
repeat
	local a = 2
	print("repeat n", n, a)
	n = n - 1
until n == 0
print(a)

for i=3,1,-1 do
	print("for i", i)
end
print()

for i=1,3 do
	print("for i", i)
end
