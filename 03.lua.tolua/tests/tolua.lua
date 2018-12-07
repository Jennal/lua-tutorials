test = package.loadlib("tolua.so", "luaopen_logger")
test()
for k,v in pairs(logger) do
	print(k,v)
end
print(logger)
logger.log(123.123)
logger.log("123.123")
print()

for k,v in pairs(package) do
	print(k,v)
end