a = 2
-- local a = 1
-- print(a, _G['a'])
-- print()

----[[
for k,v in pairs(_G) do
	print(k,v)
end
--]]

-- function f() end
-- print(f, _G['f'])
-- print()

do
	local function f() end
	print("f => ", f, _G['f'])
	print()
end

-- local function f() end
-- print(f, _G['f'])
-- print()

-- print(f, _G['f'])