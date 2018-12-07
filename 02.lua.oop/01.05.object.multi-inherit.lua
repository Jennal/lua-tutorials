local object = {
	tostring = function() end
}
object.new = function(self, o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

local movable = object:new({
	speed = 0,
	__tostring = function(t)
		return "movable: " .. t.speed
	end,
	tostring = function(t)
		return "movable: " .. t.speed
	end
})

local locatable = object:new({
	x = 0,
	y = 0,
	__tostring = function(t)
		return string.format("locatable: (%d, %d)", t.x, t.y)
	end,
	tostring = function(t)
		return string.format("locatable: (%d, %d)", t.x, t.y)
	end
})

function search(list, key)
	for _, v in ipairs(list) do
		if v[key] then
			return v[key]
		end
	end
end

function inherit(o, ...)
	o = o or {}
	setmetatable(o, {
		__index = function(t, k)
			return search(arg, k)
		end
	})

	return o
end

local monster = inherit({
	hp = 0,
	-- __tostring = function(t)
	-- 	return string.format("monster: (%d, %d, %d, %d)", t.speed, t.x, t.y, t.hp)
	-- end
}, locatable, movable)

local m = monster:new()
print(m:tostring())