if not a then
	print('not a', a)
end

if not nil then
	print('not', nil)
end

if a ~= false then
	print('a ~= false', a)
end

local a = 0
if a then
	print('a = ' .. a)
end

if a ~= true and a ~= false then
	print('a ~= true and a ~= false', a)
end

--a = nil
if a == nil then
	print('not a')
elseif a == '0' then
	print('a == true')
else
	print('else', a)
end