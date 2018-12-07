create_lib = package.loadlib("pos.so", "luaopen_pos")
create_lib()

local p = pos.new(100, 200)
print(p)
print("get from pos", pos.getX(p), pos.getY(p))
print()

print("get from instance", p:getX(), p:getY())

p.getX(p)
p:getX()