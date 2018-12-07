-- http://www.lua.org/manual/5.1/manual.html#5.4.1

-- string.find (s, pattern [, init [, plain]])
print(string.find("aaabbccc", "c+$"))
print(string.find("aaabbccc", "b+", 5))
print(string.find("aaabbccc", "b+", 5, true))
print()

-- string.match (s, pattern [, init])
print(string.match("hello WORLD HELLO", "%u+"))
print()


-- string.gmatch (s, pattern)
local s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do
	print(w)
end
print()


-- string.gsub (s, pattern, repl [, n]) => repl could be string/table/function
local result = string.gsub("hello world", "hello", "hi")
print(result)

print("-----------------")
local result = string.gsub("hello world", "(%w+)", "%1 %1")
print(result)

print("-----------------")
local result = string.gsub("hello world", "(%w+)", {
	hello = 111,
	world = 222
})
print(result)

print("-----------------")
local result = string.gsub("hello world", "(%w+)", function(w)
	print(w)
	return w .. "11"
end)
print(result)