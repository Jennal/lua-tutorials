local movable = {
	speed = 0
}

movable.__tostring = function(t)
	return "movable: " .. t.speed
end

movable.new = function(self, o)
	o = o or {} -- o ? o : {}
	setmetatable(o, self)
	self.__index = self
	return o
end

local monster = movable:new({
	hp = 0,
	__tostring = function(t)
		return string.format("monster: (%d, %d)", t.speed, t.hp)
	end
})
print(monster)

local HeroMonster = monster:new({
	name = 'hero',
	__tostring = function(t)
		return string.format("HeroMonster: %s (%d, %d)", t.name, t.speed, t.hp)
	end
})
print(HeroMonster)

local m = HeroMonster:new()
print(m)
