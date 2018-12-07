test = package.loadlib("tolua.so", "luaopen_logger")
print(logger)
print()

test()
print(logger)
print()

for k,v in pairs(logger) do
	print(k,v)
end
print()

logger.log(123.1)
logger.log("string 123.123")

logger.log(logger.where(1))